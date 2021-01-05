import 'package:cloud_firestore/cloud_firestore.dart';

class PhotoApi {


  Future<Stream<QuerySnapshot>>  get(String collection, String id) async{
   return  FirebaseFirestore.instance.collection(collection).doc(id).collection("photos").snapshots();
  }
}
