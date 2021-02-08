import 'package:cloud_firestore/cloud_firestore.dart';

class AttractionApi {
 Stream<QuerySnapshot>  getAll() async*{
   yield* FirebaseFirestore.instance.collection('attractions').snapshots();
  }
}
