import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/model/user/user.dart';

class FavouriteApi {
  Stream<DocumentSnapshot> get(String favourite) async*{
    yield*  FirebaseFirestore.instance
        .collection('attractions')
        .doc(favourite)
        .snapshots();

  }

  Stream<QuerySnapshot> getFavouritesByUser(User user) {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(user.reference.id)
        .collection('favourite')
        .snapshots();
  }

}
