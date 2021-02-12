import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/model/user/user.dart';
import 'package:travelapp/app/data/provider/favourite_api.dart';

class FavouriteRepository {
  final FavouriteApi _favouriteApi;

  FavouriteRepository(this._favouriteApi);

  Stream<DocumentSnapshot> get(String favourite) {
    return _favouriteApi.get(favourite);
  }

  Stream<QuerySnapshot> getFavouritesByUser(User user){
    return _favouriteApi.getFavouritesByUser(user);
  }

}
