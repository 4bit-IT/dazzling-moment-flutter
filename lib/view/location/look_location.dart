import 'package:damo/viewmodel/bar/app_bar.dart';
import 'package:damo/viewmodel/bar/bottom_navigaton.dart';
import 'package:flutter/material.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';

const String kakaoMapKey = '412e1951c48c2b1c68eddfd8b3608426';

class LookLocation extends StatefulWidget {
  @override
  State<LookLocation> createState() => LookLocationState();
}

class LookLocationState extends State<LookLocation> {
  DamoAppBar appBar = DamoAppBar();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar.noActionBar(context),
      bottomNavigationBar: BottomNavigation(bottomNavigationIndex: 1),
      body: KakaoMapView(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          kakaoMapKey: kakaoMapKey,
          lat: 35.107651,
          lng: 128.961425,
          showMapTypeControl: false,
          showZoomControl: false,
          // markerImageURL:
          //     'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
          onTapMarker: (message) {
            //event callback when the marker is tapped
          }),
    );
  }
}
