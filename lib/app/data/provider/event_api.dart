import 'package:cloud_firestore/cloud_firestore.dart';

class EventApi {
 Stream<QuerySnapshot>  getAll() async*{
   yield* FirebaseFirestore.instance.collection('events').snapshots();
  }
}
