import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/provider/attraction_api.dart';

class AttractionRepository{
  final AttractionApi _attractionApi;
  AttractionRepository(this._attractionApi);

  Future<Stream<QuerySnapshot>>  getAll() async{
    return _attractionApi.getAll();
  }

}