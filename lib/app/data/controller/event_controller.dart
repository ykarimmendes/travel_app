import 'package:cloud_firestore/cloud_firestore.dart';
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
    _repository.getAll().then((data) {
      Stream<QuerySnapshot> productRef = data;
      data.forEach((field){
        field.docs.asMap().forEach((index, data) {
          _eventsList.assign(Event.fromSnapshot(data));
        });
      });
    });
  }
}