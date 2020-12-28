import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/model/restaurant.dart';
import 'package:travelapp/app/data/repository/restaurant_repository.dart';

class RestaurantController extends GetxController {

  final RestaurantRepository _repository;
  RestaurantController(this._repository);

  final _restaurantsList = List<Restaurant>().obs;

  get restaurantsList => this._restaurantsList;
  set restaurantsList(value) => this._restaurantsList.assignAll(value);

  getAll() {
    _repository.getAll().then((data) {
      Stream<QuerySnapshot> productRef = data;
      productRef.forEach((field){
        field.docs.asMap().forEach((index, data) {
          _restaurantsList.add(Restaurant.fromSnapshot(data));
        });
      });
    });
  }
}