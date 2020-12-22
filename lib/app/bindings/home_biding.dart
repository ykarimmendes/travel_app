import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/event_controller.dart';
import 'package:travelapp/app/data/controller/home_controller.dart';
import 'package:travelapp/app/data/provider/event_api.dart';
import 'package:travelapp/app/data/repository/attraction_repository.dart';
import 'package:travelapp/app/data/repository/home_repository.dart';
import 'package:travelapp/app/data/repository/event_repository.dart';

class HomeBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(HomeRepository()));
    Get.lazyPut<EventController>(() => EventController(EventRepository(EventApi())));
  }
}