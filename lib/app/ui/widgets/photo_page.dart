import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/photo_controller.dart';
import 'package:travelapp/app/data/provider/photo_api.dart';
import 'package:travelapp/app/data/repository/photo_repository.dart';
import 'package:travelapp/app/ui/photo_attraction/photo_attraction_page.dart';

class PhotosPage extends StatelessWidget {
  final String _id;
  final String _collection;
  PhotosPage(this._id, this._collection);

  @override
  Widget build(BuildContext context) {
    return GetX<PhotoController>(
      initState: (state){Get.find<PhotoController>().get(_collection, _id);},
      init: PhotoController(PhotoRepository(PhotoApi())),
    builder: (_) {
    if (_.photosList.length == 0) return LinearProgressIndicator();
        return GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 12),
          physics: NeverScrollableScrollPhysics(),
          itemCount: _.photosList.length,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PhotoAttractionPage(_.photosList[index])),
                );
              },
              child: Card(
                elevation: 4,
                child: Image.network(
                  _.photosList[index].urlThumb,
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
