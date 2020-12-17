import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/model/social_media.dart';

import 'address.dart';

class Restaurant {
  final String title;
  final String category;
  final String image;
  final String about;
  final List<String> sub;
  final Address address;
  final String openingHour;
  final DocumentReference reference;
  final Map<String, dynamic> _socialMedia;

  List<SocialMedia> getAllSocialMedia() {
    SocialMedia sm = new SocialMedia();
    return sm.getAllSocialMedia(_socialMedia);
  }

  Restaurant.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Restaurant.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        about = map['about'],
        category = map['category'],
        image = map['image'],
        openingHour = map['opening_hour'],
        sub = List.from(map['sub']),
        _socialMedia = map['social_media'],
        address = Address.fromMap(map);
}
