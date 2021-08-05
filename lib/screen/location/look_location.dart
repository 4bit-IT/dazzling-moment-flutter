import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../drawer.dart';
import '../app_bar.dart';
import '../bottom_navigaton.dart';

class LookLocation extends StatefulWidget {
  @override
  State<LookLocation> createState() => LookLocationState();
}

class LookLocationState extends State<LookLocation> {
  DamoAppBar appBar = DamoAppBar();
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _myLocation = CameraPosition(
    target: LatLng(35.10835, 128.95972),
    zoom: 18.5,
  );

  // static final CameraPosition _kLake = CameraPosition(
  //     bearing: 192.8334901395799,
  //     target: LatLng(37.43296265331129, -122.08832357078792),
  //     tilt: 59.440717697143555,
  //     zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerButton(),
      appBar: appBar.appBar(context),
      bottomNavigationBar: BottomNavigation(bottomNavigationIndex: 1),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _myLocation,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }

  // Future<void> _goToTheLake() async {
  //   final GoogleMapController controller = await _controller.future;
  //   controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  // }
}
