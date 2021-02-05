import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/provider/home_api.dart';

class HomeRepository {
  final HomeApi _homeApi;

  HomeRepository(this._homeApi);

  Future<Stream<QuerySnapshot>> getUser() async {
    return _homeApi.getUser();
  }
  
}