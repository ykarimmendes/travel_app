import 'package:cloud_firestore/cloud_firestore.dart';

class HomeApi {
 Future<Stream<QuerySnapshot>>  getUser() async{
   Stream<QuerySnapshot> s = FirebaseFirestore.instance.collection('user').snapshots();
    return s;
  }
}
