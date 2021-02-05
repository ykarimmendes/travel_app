import 'package:cloud_firestore/cloud_firestore.dart';

class LoginApi {
 Future<Stream<QuerySnapshot>>  getAll() async{
   Stream<QuerySnapshot> s = FirebaseFirestore.instance.collection('user').snapshots();
    return s;
  }
}
