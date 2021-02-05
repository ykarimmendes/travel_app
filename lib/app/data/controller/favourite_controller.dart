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
    _repository.getFavouritesByUser(user).listen((element) {
      element.forEach((element2) {
        _repository.get(element2).listen((data) {
          _favouritesList.assign(Attraction.fromSnapshot(data));
        });
      });
    });
  }

}