import 'package:cloud_firestore/cloud_firestore.dart';

class Photo {
  final int order;
  final String url;
  final String urlThumb;
  final DocumentReference reference;

  Photo.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Photo.fromMap(Map<String, dynamic> map, {this.reference})
      : order = map['order'],
        url = map['url'],
        urlThumb = map['url_thumb'];
}
