import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/model/user/user.dart';

class FavouriteApi {
  Stream<DocumentSnapshot> get(String favourite) async* {
    yield* FirebaseFirestore.instance
        .collection('attractions')
        .doc(favourite)
        .snapshots();
  }

  Stream<QuerySnapshot> getFavouritesByUser(User user) async* {
    yield* FirebaseFirestore.instance
        .collection('user')
        .doc(user.reference.id)
        .collection('favourite')
        .snapshots();
  }

  removeFavourites(String id, User user) {
    return FirebaseFirestore.instance
        .collection('user')
        .doc(user.reference.id)
        .collection('favourite')
        .doc(id)
        .delete();
  }

  addFavourites(String id, int type, User user) {
    FirebaseFirestore.instance
        .collection('user')
        .doc(user.reference.id)
        .collection('favourite')
        .doc(id)
        .set({'id': id, 'type': type});
  }
}
