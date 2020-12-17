import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/app/data/model/photo.dart';
import 'package:travelapp/app/ui/photo_attraction/photo_attraction_page.dart';

class PhotosPage extends StatelessWidget {
  final String _id;
  final String _collection;
  PhotosPage(this._id, this._collection);

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _fb = FirebaseFirestore.instance;
    List<Photo> _photos = new List<Photo>();
    Photo _photo;
    return StreamBuilder<QuerySnapshot>(
      stream:
          _fb.collection(_collection).doc(_id).collection("photos").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator();
        snapshot.data.docs.forEach((element) {
          _photo = new Photo.fromSnapshot(element);
          _photos.add(_photo);
        });
        return GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 12),
          physics: NeverScrollableScrollPhysics(),
          itemCount: _photos.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PhotoAttractionPage(_photos[index])),
                );
              },
              child: Card(
                elevation: 4,
                child: Image.network(
                  _photos[index].urlThumb,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
