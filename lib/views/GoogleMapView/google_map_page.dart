import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../config.dart';

class GoogleMapPageWidget extends StatefulWidget {
  @override
  _GoogleMapPageWidgetState createState() => _GoogleMapPageWidgetState();
}

class _GoogleMapPageWidgetState extends State<GoogleMapPageWidget> {
  Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(28.7041, 77.1025);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}