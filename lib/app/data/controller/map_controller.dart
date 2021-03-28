import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelapp/app/data/model/attraction.dart';
import 'package:travelapp/app/data/model/mapApp.dart';
import 'package:travelapp/app/data/model/user/favourite.dart';
import 'package:travelapp/app/ui/theme/utils.dart';
import 'package:travelapp/map.page.dart';

class MapController extends GetxController {

  final _mapAppList = List<MapApp>().obs;

  get mapAppList => this._mapAppList.value;

  set mapAppList(value) => this._mapAppList.assignAll(value);

  Set<Marker> markers;

  List<MapApp> getMapApp(List<Attraction> atts) {
    _mapAppList.clear();
    MapApp m;
    int x=0;
    atts.forEach((element) {
      m = new MapApp(element.title, element.geoPoint,x, element.reference );
      _mapAppList.add(m);
      x++;
    });
    return _mapAppList;
  }

  bool click(int index) {
    _mapAppList[index].isMapClicked = !_mapAppList[index].isMapClicked;
    if (_mapAppList[index].isMapClicked == false)
      removeMarker(_mapAppList[index].title);
    else
      addMarker(_mapAppList[index].title);

    return _mapAppList[index].isMapClicked;
  }

  Set<Marker> removeMarker(String id) {
    markers.removeWhere((element) => element.markerId.value == id);
    return markers;
  }

  Set<Marker> addMarker(String id) {
    markers.add(createMarker(id));
    return markers;
  }


  Set<Marker> createAllMarkers(List<MapApp> mapApps, String idClicked, List<Favourite> favourites) {
    if (markers != null)
      return markers;

    markers = new Set<Marker>();
    for (var att in mapApps) {
      if (idClicked != att.title && favourites.where((element) => element.id == att.reference.id  && element.type == 2).length == 0)
        continue;
      GeoPoint geoPoint = att.geoPoint;
      String description = att.title;
      LatLng position = LatLng(geoPoint.latitude, geoPoint.longitude);
      final Marker marker = Marker(
          markerId: new MarkerId(att.title),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(Util.marker[att.valueColor]),
          infoWindow: InfoWindow(title: description));
      markers.add(marker);
    }
    return markers;
  }

  Marker createMarker(String id) {
    MapApp att = _mapAppList.where((e) => e.title == id).single;
      GeoPoint geoPoint = att.geoPoint;
      String description = att.title;
      LatLng position = LatLng(geoPoint.latitude, geoPoint.longitude);
      final Marker marker = Marker(
          markerId: new MarkerId(att.title),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(Util.marker[att.valueColor]),
          infoWindow: InfoWindow(title: description));
     return marker;
  }
}