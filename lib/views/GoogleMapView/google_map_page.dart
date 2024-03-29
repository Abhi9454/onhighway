import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:onhighway/viewModels/request_service_view_model.dart';

import '../../config.dart';
import 'package:map_picker/map_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapPageWidget extends StatefulWidget {
  @override
  _GoogleMapPageWidgetState createState() => _GoogleMapPageWidgetState();
}

class _GoogleMapPageWidgetState extends State<GoogleMapPageWidget> {
  final _controller = Completer<GoogleMapController>();
  MapPickerController mapPickerController = MapPickerController();
  late Position position;
  double _lat = 28.7041;
  double _lng = 77.1025;
  late CameraPosition cameraPosition;

  void getLocation() async {
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print("Position is " + position.toString());
    setState(() {
      cameraPosition = CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 12,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    cameraPosition = CameraPosition(
      target: LatLng(_lat, _lng),
      zoom: 12,
    );
  }

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RequestServiceViewModel>(
      create: (_) => RequestServiceViewModel(),
      child: Consumer<RequestServiceViewModel>(
        builder: (con, requestViewModel, _) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: AppBar(
                backgroundColor: AppConfig().secondary,
                leading: IconButton(
                  icon: Icon(CupertinoIcons.back, color: AppConfig().primary),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                title: Text(
                  'Select Service Location',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 22),
                ),
              ),
            ),
            body: Stack(
              alignment: Alignment.topCenter,
              children: [
                MapPicker(
                  // pass icon widget
                  iconWidget: SvgPicture.asset(
                    "assets/map-pin.svg",
                    height: 60,
                  ),
                  //add map picker controller
                  mapPickerController: mapPickerController,
                  child: GoogleMap(
                    myLocationEnabled: true,
                    zoomControlsEnabled: false,
                    // hide location button
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    //  camera position
                    initialCameraPosition: cameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                      getLocation();
                    },
                    onCameraMoveStarted: () {
                      // notify map is moving
                      mapPickerController.mapMoving!();
                      textController.text = "checking ...";
                    },
                    onCameraMove: (cameraPosition) {
                      this.cameraPosition = cameraPosition;
                    },
                    onCameraIdle: () async {
                      // notify map stopped moving
                      mapPickerController.mapFinishedMoving!();
                      //get address name from camera position
                      List<Placemark> placemarks =
                          await placemarkFromCoordinates(
                        cameraPosition.target.latitude,
                        cameraPosition.target.longitude,
                      );

                      // update the ui with the address
                      textController.text =
                          '${placemarks.first.name}, ${placemarks.first.administrativeArea}, ${placemarks.first.country}';
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).viewPadding.top + 20,
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  child: TextFormField(
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    readOnly: true,
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none),
                    controller: textController,
                  ),
                ),
                Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: SizedBox(
                    height: 50,
                    child: TextButton(
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFFFFFFFF),
                          fontSize: 19,
                          // height: 19/19,
                        ),
                      ),
                      onPressed: () async {
                        print(
                            "Location ${cameraPosition.target.latitude} ${cameraPosition.target.longitude}");
                        print("Address: ${textController.text}");
                        if (cameraPosition.target.latitude.isFinite ||
                            cameraPosition.target.longitude.isFinite) {
                          // Provider.of<RequestServiceViewModel>(context,
                          //         listen: false)
                          //     .setLocation(
                          //         cameraPosition.target.latitude.toString() +
                          //             ',' +
                          //             cameraPosition.target.longitude.toString());
                          await requestViewModel.setLocation(
                              cameraPosition.target.latitude.toString() +
                                  ',' +
                                  cameraPosition.target.longitude.toString());
                          Navigator.of(context).pop();
                        }
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFA3080C)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
