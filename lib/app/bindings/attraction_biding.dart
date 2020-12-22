import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/event_controller.dart';
import 'package:travelapp/app/data/provider/event_api.dart';
import 'package:travelapp/app/data/repository/event_repository.dart';

class EventBiding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventController>(() {
      return EventController(
          EventRepository(EventApi()));
    });
  }
}