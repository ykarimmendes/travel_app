import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/favourite_controller.dart';
import 'package:travelapp/app/data/provider/favourite_api.dart';
import 'package:travelapp/app/data/repository/favourite_repository.dart';

class FavouriteBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavouriteController>(() {
      return FavouriteController(
          FavouriteRepository(FavouriteApi()));
    });
  }
}