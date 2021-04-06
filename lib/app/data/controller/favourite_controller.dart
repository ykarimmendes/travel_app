import 'package:get/get.dart';
import 'package:travelapp/app/data/model/Local.dart';
import 'package:travelapp/app/data/model/attraction.dart';
import 'package:travelapp/app/data/model/event.dart';
import 'package:travelapp/app/data/model/restaurant.dart';
import 'package:travelapp/app/data/model/user/favourite.dart';
import 'package:travelapp/app/data/model/user/user.dart';
import 'package:travelapp/app/data/repository/favourite_repository.dart';

class FavouriteController extends GetxController {
  final FavouriteRepository _repository;
  User _user;

  FavouriteController(this._repository);

  final _favouritesLocal = List<Local>().obs;

  get favouritesLocal => this._favouritesLocal;

  final _favouritesUser = List<Favourite>().obs;

  get favouritesUser => this._favouritesUser;

  final _isFavourite = false.obs;

  get isFavourite => this._isFavourite.value;

  set isFavourite(value) => this._isFavourite.value = value;

  bool getIsFavourite(String id) {
    int val = _favouritesUser
        .indexWhere((element) => element.id.toString() == id.toString());
    isFavourite = val >= 0;
    return isFavourite;
  }

  bool getIsFavourite2(String id) {
    int val = _favouritesUser
        .indexWhere((element) => element.id.toString() == id.toString());
    return val >= 0;
  }

  removeFavourites(String id, User user) {
    _repository.removeFavourites(id, user);
  }

  addFavourites(String id, int type, User user) {
    _repository.addFavourites(id, type, user);
  }

  Stream<List<Favourite>> getFavouritesByUser(User user) async* {
    _user = user;
    _repository.getFavouritesByUser(user).listen((event) {
      favouritesUser.clear();
      _favouritesLocal.clear();
      event.docs.forEach((e) {
        Favourite fav =
            new Favourite.fromNew(e.get('id').toString().trim(), e.get('type'));
        favouritesUser.add(fav);
      });
      _getFavourites();
    });
    yield favouritesUser;
  }

  _getFavourites() {
    favouritesUser.forEach(
      (element) {
        _repository.get(element.id).listen(
          (data) {
            if (element.type == 2) {
              favouritesLocal.add(Local.fromSnapshot(data));
            }
            /*
            if (element.type == 1) {
              favouritesLocal.add(Local.fromSnapshot(data));
            } else if (element.type == 2) {
              favouritesLocal.add(Local.fromSnapshot(data));
            } else if (element.type == 3) {
              favouritesLocal.add(Local.fromSnapshot(data));
            }
             */
          },
        );
      },
    );
  }
}
