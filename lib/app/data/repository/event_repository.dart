import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/provider/event_api.dart';

class EventRepository{
  final EventApi _eventApi;
  EventRepository(this._eventApi);

  Stream<QuerySnapshot>  getAll() {
    return _eventApi.getAll();
  }

}