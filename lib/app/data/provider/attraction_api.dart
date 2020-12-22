import 'package:cloud_firestore/cloud_firestore.dart';

class EventApi {
 Future<Stream<QuerySnapshot>>  getAll() async{
   Stream<QuerySnapshot> s = FirebaseFirestore.instance.collection('events').snapshots();
    return s;
  }
}
