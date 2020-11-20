import 'package:cloud_firestore/cloud_firestore.dart';

class Attraction {
  String title;
  String resume;
  int top;
  String image;
  final DocumentReference reference;

  Attraction.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  Attraction.fromMap(Map<String, dynamic> map, {this.reference})
      : title = map['title'],
        resume = map['resume'],
        top = map['top'],
        image = map['image'];

/*
        3,
        "Museu de Hábitos e Costumes",
        "Museu histórico, com objetos como roupas, bolsas e chapéus",
        "assets/museu.jpeg",
        "Top #3 Museus");
        */

}
