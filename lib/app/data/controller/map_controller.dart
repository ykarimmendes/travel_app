
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelapp/app/data/model/attraction.dart';
import 'package:travelapp/app/data/model/mapApp.dart';
import 'package:travelapp/app/ui/theme/utils.dart';
import 'package:travelapp/map.page.dart';

class MapController extends GetxController {

  final _mapAppList = List<MapApp>().obs;
  get mapAppList => this._mapAppList.value;
  set mapAppList(value) => this._mapAppList.assignAll(value);

  Set<Marker> markers;

  List<MapApp> getMapApp(List<Attraction> atts){
    _mapAppList.clear();
    MapApp m;
    atts.forEach((element) {
      m = new MapApp(element.title, element.geoPoint, element.reference);
      _mapAppList.add(m);
    });
    return _mapAppList;
  }

  bool click(int index){
    _mapAppList[index].isMapClicked = !_mapAppList[index].isMapClicked;
    return _mapAppList[index].isMapClicked;
  }

  Set<Marker> removeMarker( int index) {
    markers.removeWhere((element) => element.markerId.value == markers.elementAt(index).markerId.value);
    return markers;
  }

  Set<Marker> createMarker(List<MapApp> mapApps) {
    markers = new Set<Marker>();
    int x = 0;
    for (var att in mapApps) {
      GeoPoint geoPoint = att.geoPoint;
      String description = att.title;
      LatLng position = LatLng(geoPoint.latitude, geoPoint.longitude);
      final Marker marker = Marker(
          markerId: new MarkerId(att.title),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(Util.marker[x]),
          infoWindow: InfoWindow(title: description));
      //setState(() {
      x++;
      markers.add(marker);
      //});
    }
    return markers;
  }
}