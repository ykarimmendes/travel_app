import 'package:cloud_firestore/cloud_firestore.dart';

class HomeApi {
 Stream<QuerySnapshot>  getUser() {
   return FirebaseFirestore.instance.collection('user').snapshots();
  }
}
