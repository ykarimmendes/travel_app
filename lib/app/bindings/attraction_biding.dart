import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/attraction_controller.dart';
import 'package:travelapp/app/data/provider/attraction_api.dart';
import 'package:travelapp/app/data/repository/attraction_repository.dart';

class AttractionBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttractionController>(() {
      return AttractionController(
          AttractionRepository(AttractionApi()));
    });
  }
}