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

  final _favouritesUser = List<String>().obs;
  get favouritesUser => this._favouritesUser.value;
  set favouritesUser(value) => this._favouritesUser.assignAll(value);

  Stream<List<String>> getFavouritesByUser(User user) async* {
  _repository.getFavouritesByUser(user).listen((event) {
       favouritesUser.clear();
       _favouritesList.clear();
       event.docs.forEach((e){
         favouritesUser.add(e.get('id').toString().trim());
      });
       _getFavourites();

    });
  yield favouritesUser;
  }

  _getFavourites() {
      favouritesUser.forEach((element) {
        _repository.get(element).listen((data) {
          int valDel = _favouritesList.indexWhere((element) => element.reference.id == data.reference.id);
          if (valDel >=0) {
            Attraction att = Attraction.fromSnapshot(data);
            att.isFavourite = favouritesUser.any((element) => element == att.reference.id);
            _favouritesList.removeAt(valDel);
            _favouritesList.insert(valDel,att);
          }else{
            _favouritesList.add(Attraction.fromSnapshot(data));
          }

        });
      });
  }


}