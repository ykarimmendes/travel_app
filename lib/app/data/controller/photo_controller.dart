import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/model/photo.dart';
import 'package:travelapp/app/data/repository/photo_repository.dart';

class PhotoController extends GetxController {

  final PhotoRepository _repository;
  PhotoController(this._repository);

  final _photosList = List<Photo>().obs;

  get photosList => this._photosList;
  set photosList(value) => this._photosList.assignAll(value);

  get(String collection, String id) {
    _repository.get(collection, id).then((data) {
      Stream<QuerySnapshot> productRef = data;
      productRef.forEach((field){
        field.docs.asMap().forEach((index, data) {
          _photosList.add(Photo.fromSnapshot(data));
        });
      });
    });
  }
}