import 'package:cloud_firestore/cloud_firestore.dart';


class LoginApi {
  Future<QuerySnapshot> getAll() async {
    return await FirebaseFirestore.instance
        .collection('user')
        .get();

  }

}
