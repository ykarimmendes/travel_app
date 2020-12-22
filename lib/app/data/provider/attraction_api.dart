import 'package:cloud_firestore/cloud_firestore.dart';

class AttractionApi {
 Future<Stream<QuerySnapshot>>  getAll() async{
   Stream<QuerySnapshot> s = FirebaseFirestore.instance.collection('attractions').snapshots();
    return s;
  }
}
