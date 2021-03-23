import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class MapApp {

  String title;
  GeoPoint geoPoint;
  DocumentReference reference;

  final _isMapClicked = false.obs;
  get isMapClicked => this._isMapClicked.value;
  set isMapClicked(value) => this._isMapClicked.value = value;

  final _isFavourite = false.obs;
  get isFavourite => this._isFavourite.value;
  set isFavourite(value) => this._isFavourite.value = value;

  MapApp(String _title, GeoPoint _geoPoint, DocumentReference _reference)
      : title = _title,
        geoPoint = _geoPoint,
        reference = _reference;
}