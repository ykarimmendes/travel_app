import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/restaurant_controller.dart';
import 'package:travelapp/app/data/provider/restaurant_api.dart';
import 'package:travelapp/app/data/repository/restaurant_repository.dart';

class RestaurantBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantController>(() {
      return RestaurantController(
          RestaurantRepository(RestaurantApi()));
    });
  }
}