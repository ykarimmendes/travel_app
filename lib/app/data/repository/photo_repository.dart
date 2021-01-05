import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/provider/photo_api.dart';

class PhotoRepository{
  final PhotoApi _photoApi;
  PhotoRepository(this._photoApi);

  Future<Stream<QuerySnapshot>>  get(String collection, String id) async{
    return _photoApi.get(collection, id);
  }

}