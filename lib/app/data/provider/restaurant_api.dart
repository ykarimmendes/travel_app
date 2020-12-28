import 'package:cloud_firestore/cloud_firestore.dart';

class RestaurantApi {
 Future<Stream<QuerySnapshot>>  getAll() async{
   Stream<QuerySnapshot> s = FirebaseFirestore.instance.collection('business').snapshots();
    return s;
  }
}
