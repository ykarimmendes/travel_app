import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/provider/restaurant_api.dart';

class RestaurantRepository{
  final RestaurantApi _restaurantApi;
  RestaurantRepository(this._restaurantApi);

  Future<Stream<QuerySnapshot>>  getAll() async{
    return _restaurantApi.getAll();
  }

}