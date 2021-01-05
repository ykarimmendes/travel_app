import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/photo_controller.dart';
import 'package:travelapp/app/data/provider/photo_api.dart';
import 'package:travelapp/app/data/repository/photo_repository.dart';

class PhotoBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoController>(() {
      return PhotoController(
          PhotoRepository(PhotoApi()));
    });
  }
}