import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:travelapp/app/data/model/social_media.dart';

class Photographer{

  final String name;
  final Map<String, dynamic> _socialMedia;
  final DocumentReference reference;


  List<SocialMedia> getAllSocialMedia() {
    SocialMedia sm = new SocialMedia();
    return sm.getAllSocialMedia(_socialMedia);
  }

Photographer.fromSnapshot(DocumentSnapshot snapshot)
        : this.fromMap(snapshot.data(), reference: snapshot.reference);

Photographer.fromMap(Map<String, dynamic> map, {this.reference})
    : name = map['name'],
    _socialMedia = map['social_media'];
}

