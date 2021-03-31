import 'package:cloud_firestore/cloud_firestore.dart';

 class Local{

  final String title;
  final   String resume;
  final DocumentReference reference;
  final String photoCover;
  final  String photoCoverThumb;

  Local.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Local.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        resume = map['resume'],
        photoCover = map['photo_cover'],
        photoCoverThumb = map['photo_cover_thumb'];


}