
import 'package:get/get.dart';
import 'package:travelapp/app/data/model/attraction.dart';
import 'package:travelapp/app/data/model/user/user.dart';
import 'package:travelapp/app/data/repository/attraction_repository.dart';

class AttractionController extends GetxController {

  final AttractionRepository _repository;
  AttractionController(this._repository);

  final _attractionsList = List<Attraction>().obs;
  get attractionsList => this._attractionsList;
  set attractionsList(value) => this._attractionsList.value;

  getAll()  {
    _repository.getAll().listen((data) {
        data.docs.asMap().forEach((index, data) {
          Attraction att = Attraction.fromSnapshot(data);
          _attractionsList.add(att);
        });
    });
  }

  isFavourite(User user,Attraction att){
    return user.favourites.any((element) => element == att.reference.id);
  }

}