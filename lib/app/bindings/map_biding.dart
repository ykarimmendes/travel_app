import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/map_controller.dart';

class MapBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapController>(() {
      return MapController();
    });
  }
}