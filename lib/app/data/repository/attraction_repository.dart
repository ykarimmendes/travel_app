import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/provider/attraction_api.dart';

class AttractionRepository{
  final AttractionApi _attractionApi;
  AttractionRepository(this._attractionApi);

  Stream<QuerySnapshot>  getAll() async*{
    yield* _attractionApi.getAll();
  }

}