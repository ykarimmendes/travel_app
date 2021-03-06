
import 'package:get/get.dart';
import 'package:travelapp/app/data/model/event.dart';
import 'package:travelapp/app/data/repository/event_repository.dart';

class EventController extends GetxController {

  final EventRepository _repository;
  EventController(this._repository);

  final _eventsList = List<Event>().obs;

  get eventsList => this._eventsList;
  set eventsList(value) => this._eventsList.assignAll(value);

  getAll() {
    _repository.getAll().listen((data) {
      data.docs.forEach((field){
          _eventsList.assign(Event.fromSnapshot(field));
      });
    });
  }
}