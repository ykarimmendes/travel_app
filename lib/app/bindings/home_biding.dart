import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/attraction_controller.dart';
import 'package:travelapp/app/data/controller/event_controller.dart';
import 'package:travelapp/app/data/controller/home_controller.dart';
import 'package:travelapp/app/data/controller/login_controller.dart';
import 'package:travelapp/app/data/model/user/user.dart';
import 'package:travelapp/app/data/provider/attraction_api.dart';
import 'package:travelapp/app/data/provider/event_api.dart';
import 'package:travelapp/app/data/provider/home_api.dart';
import 'package:travelapp/app/data/provider/login_api.dart';
import 'package:travelapp/app/data/repository/attraction_repository.dart';
import 'package:travelapp/app/data/repository/home_repository.dart';
import 'package:travelapp/app/data/repository/event_repository.dart';
import 'package:travelapp/app/data/repository/login_repository.dart';

class HomeBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(HomeRepository(HomeApi())));
    Get.lazyPut<EventController>(() => EventController(EventRepository(EventApi())));
    Get.lazyPut<AttractionController>(() => AttractionController(AttractionRepository(AttractionApi())));
    Get.lazyPut<LoginController>(() => LoginController(LoginRepository(LoginApi())));
  }
}