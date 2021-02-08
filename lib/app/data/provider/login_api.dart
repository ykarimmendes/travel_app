import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:travelapp/app/data/model/photo.dart';
import 'package:travelapp/app/data/model/user/user.dart';

class LoginApi {
  Future<List<User>> getAll() async {
    return await FirebaseFirestore.instance
        .collection('user')
        .get()
        .then((doc) => doc.documents.map((document) {
              return User.fromSnapshot(document);
            }).toList());

  }

  Future<List<String>> getFavouritesByUser(User user) async {
    return await FirebaseFirestore.instance
        .collection('user')
        .doc(user.reference.id)
        .collection('favourite')
        .get()
        .then((event) =>
            event.docs.map((e) => e.get('id').toString().trim()).toList());
  }
}
