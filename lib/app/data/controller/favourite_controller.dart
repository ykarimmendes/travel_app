import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/model/attraction.dart';
import 'package:travelapp/app/data/model/user/user.dart';
import 'package:travelapp/app/data/repository/favourite_repository.dart';

class FavouriteController extends GetxController {

  final FavouriteRepository _repository;

  FavouriteController(this._repository);

  final _favouritesList = List<Attraction>().obs;

  get favouritesList => this._favouritesList;
  set favouritesList(value) => this._favouritesList.assignAll(value);

  get(User user){
      user.favourites.forEach((element) {
        _repository.get(element).listen((data) {
          _favouritesList.assign(Attraction.fromSnapshot(data));
        });
      });

  }

}