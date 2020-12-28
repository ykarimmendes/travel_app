import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/model/attraction.dart';
import 'package:travelapp/app/data/repository/attraction_repository.dart';

class AttractionController extends GetxController {

  final AttractionRepository _repository;
  AttractionController(this._repository);

  final _attractionsList = List<Attraction>().obs;

  get attractionsList => this._attractionsList;
  set attractionsList(value) => this._attractionsList.assignAll(value);

  getAll() {
    _repository.getAll().then((data) {
      Stream<QuerySnapshot> productRef = data;
      productRef.forEach((field){
        field.docs.asMap().forEach((index, data) {
          _attractionsList.add(Attraction.fromSnapshot(data));
        });
      });
    });
  }
}