import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/model/social_media.dart';

import 'Local.dart';
import 'address.dart';

class Restaurant extends Local {

  final String category;
  final String about;
  final List<String> sub;
  final Address address;
  final String openingHour;
  final GeoPoint geoPoint;
  final Map<String, dynamic> _socialMedia;

  List<SocialMedia> getAllSocialMedia() {
    SocialMedia sm = new SocialMedia();
    return sm.getAllSocialMedia(_socialMedia);
  }

  Restaurant.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), snapshot.reference);

  Restaurant.fromMap(Map<String, dynamic> map, DocumentReference reference)
      :
        about = map['about'],
        category = map['category'],
        openingHour = map['opening_hour'],
        sub = List.from(map['sub']),
        _socialMedia = map['social_media'],
        geoPoint = map['geoLocation'],
        address = Address.fromMap(map),
        super.fromMap(map, reference: reference);
}
