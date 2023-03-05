import 'package:flutter/material.dart';

import 'dart:developer';

import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:onhighway/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:permission_handler/permission_handler.dart' as permission;
import 'package:geocoding/geocoding.dart' as geocoder;



class SelectPinLocationPageWidget extends StatefulWidget {
  const SelectPinLocationPageWidget({Key? key}) : super(key: key);

  @override
  State<SelectPinLocationPageWidget> createState() => _SelectPinLocationPageWidgetState();
}

class _SelectPinLocationPageWidgetState extends State<SelectPinLocationPageWidget> {

  loc.Location currentLocation = loc.Location();
  Set<Marker> markers = {};
  GoogleMapController? googleMapController;
  bool isPermissionGranted = false;
  late loc.LocationData locationDetails;
  LatLng newLatLng = const LatLng(28.7041, 77.1025);
  String pickUpPinCode = '000000';
  String googleApikey = "AIzaSyA2mDXvdfVdZtgHLbpko5PD2DCM9MqtXgE";
  String location = "Search Location";
  String dropLocationAddress = '';
  late SharedPreferences prefs;

  void getLocation() async {
    await [permission.Permission.location].request();
    if (await permission.Permission.location.status.isGranted) {
      setState(() {
        isPermissionGranted = true;
      });
      locationDetails = await currentLocation.getLocation();
      var address = await geocoder.placemarkFromCoordinates(
          locationDetails.latitude!, locationDetails.longitude!);

      googleMapController?.animateCamera(CameraUpdate.newLatLng(LatLng(
          locationDetails.latitude ?? 0.0, locationDetails.longitude ?? 0.0)));
      setState(() {
        pickUpPinCode = address[0].postalCode.toString();
        dropLocationAddress = address[0].street.toString() +
            ' , ' +
            address[0].administrativeArea.toString() +
            ' , ' +
            address[0].country.toString() +
            ' , ' +
            address[0].postalCode.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
    print(isPermissionGranted);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConfig().secondary,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 25,
          ),
        ),
        title: Text(
          'Select Location',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold,color: AppConfig().primary),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft:
              Radius.circular(25.0),
              topRight:
              Radius.circular(25.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      child: GoogleMap(
                        zoomControlsEnabled: true,
                        initialCameraPosition:
                        const CameraPosition(
                          target: LatLng(
                              28.7041, 77.1025),
                          zoom: 15.0,
                        ),
                        onMapCreated:
                            (GoogleMapController
                        controller) {
                          setState(() {
                            googleMapController =
                                controller;
                          });
                        },
                        tiltGesturesEnabled:
                        false,
                        myLocationEnabled: true,
                        myLocationButtonEnabled:
                        true,
                        markers: markers,
                        onCameraMove: (position) {
                          newLatLng =
                              position.target;
                        },
                        onCameraIdle: () async {

                          var address = await geocoder
                              .placemarkFromCoordinates(
                              newLatLng
                                  .latitude,
                              newLatLng
                                  .longitude);
                          print("this is address "+ address.toString());
                          setState(() {
                            pickUpPinCode =
                                address[0]
                                    .postalCode
                                    .toString();
                            dropLocationAddress = address[
                            0]
                                .street
                                .toString() +
                                ' , ' +
                                address[0]
                                    .administrativeArea
                                    .toString() +
                                ' , ' +
                                address[0]
                                    .country
                                    .toString() +
                                ' , ' +
                                address[0]
                                    .postalCode
                                    .toString();
                            //Provider.of<AddAddressPageViewModel>(context,listen: false).setLocation(newLatLng.latitude.toString(),newLatLng.longitude.toString());
                          });
                          print("this is drop Location address "+ dropLocationAddress.toString());
                        },
                      ),
                    ),
                    Positioned(
                      //search input bar
                        top: 10,
                        child: InkWell(
                            onTap: () async {
                              var place = await PlacesAutocomplete
                                  .show(
                                  context:
                                  context,
                                  apiKey:
                                  googleApikey,
                                  mode: Mode
                                      .overlay,
                                  types: [],
                                  strictbounds:
                                  false,
                                  components: [
                                    Component(
                                        Component
                                            .country,
                                        'in')
                                  ],
                                  //google_map_webservice package
                                  onError:
                                      (err) {
                                    log(err
                                        .toString());
                                  });

                              if (place != null) {
                                setState(() {
                                  location = place
                                      .description
                                      .toString();
                                });

                                //form google_maps_webservice package
                                final plist =
                                GoogleMapsPlaces(
                                  apiKey:
                                  googleApikey,
                                  apiHeaders:
                                  await const GoogleApiHeaders()
                                      .getHeaders(),
                                  //from google_api_headers package
                                );
                                String placeId =
                                    place.placeId ??
                                        "0";
                                final detail =
                                await plist
                                    .getDetailsByPlaceId(
                                    placeId);
                                final geometry =
                                detail.result
                                    .geometry!;
                                final lat =
                                    geometry
                                        .location
                                        .lat;
                                final lang =
                                    geometry
                                        .location
                                        .lng;
                                var newLocation =
                                LatLng(lat,
                                    lang);

                                //move map camera to selected place with animation
                                googleMapController?.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                        CameraPosition(
                                            target:
                                            newLocation,
                                            zoom:
                                            17)));
                              }
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets
                                  .only(
                                  left: 5),
                              child: Card(
                                child: Container(
                                    padding:
                                    const EdgeInsets
                                        .all(
                                        0),
                                    width: MediaQuery.of(context).size.width *
                                        0.8,
                                    child:
                                    ListTile(
                                      title: Text(
                                        location,
                                        style: const TextStyle(
                                            fontSize:
                                            15),
                                      ),
                                      trailing:
                                      const Icon(
                                          Icons.search),
                                      dense: true,
                                    )),
                              ),
                            ))),
                    const Align(
                      alignment: Alignment.center,
                      child: Icon(
                        FontAwesomeIcons.mapPin,
                        color: Colors.deepOrange,
                        size: 35,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      child: Center(
                        child: SizedBox(
                          width:
                          MediaQuery.of(context).size.width * 0.8,
                          child: ListTile(
                            title: Container(
                              color: Colors.white,
                              padding:
                              const EdgeInsets
                                  .all(5.0),
                              child:  Text(
                                  dropLocationAddress),
                            ),
                            trailing: Material(
                              type: MaterialType
                                  .transparency,
                              child: Ink(
                                decoration:
                                BoxDecoration(
                                  border:
                                  Border.all(
                                      width: 1),
                                  color: AppConfig().secondary,
                                ),
                                child: InkWell(
                                  //borderRadius: BorderRadius.circular(100.0),
                                  onTap: () async {
                                  },
                                  child:
                                   Padding(
                                    padding:
                                    EdgeInsets
                                        .all(
                                        10.0),
                                    child: Icon(
                                      Icons
                                          .arrow_forward_rounded,
                                      size: 20.0,
                                      color: AppConfig().primary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
