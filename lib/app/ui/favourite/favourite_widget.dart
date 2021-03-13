import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/favourite_controller.dart';
import 'package:travelapp/app/data/controller/home_controller.dart';
import 'package:travelapp/app/data/controller/login_controller.dart';
import 'package:travelapp/app/data/model/user/user.dart';
import 'package:travelapp/app/data/provider/favourite_api.dart';
import 'package:travelapp/app/data/provider/login_api.dart';
import 'package:travelapp/app/data/repository/favourite_repository.dart';
import 'package:travelapp/app/data/repository/login_repository.dart';
import 'package:travelapp/app/ui/widgets/icons_page.dart';
import 'package:travelapp/map.page.dart';

class FavouriteWidget extends GetView<HomeController> {
  final GeoPoint geoPoint;
  final String description;
  final favouriteController =
      Get.put(FavouriteController(FavouriteRepository(FavouriteApi())));
  final userController = Get.put(LoginController(LoginRepository(LoginApi())));

  final String id;
  final int type;

  FavouriteWidget({this.description, this.id, this.type, this.geoPoint});

  @override
  Widget build(BuildContext context) {
    favouriteController.getIsFavourite(id);
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Obx(
            () => (IconPage(
              voidCallback: () => favouriteTap(id, type),
              text: "Favorito",
              icon: Icons.favorite,
              iconColor:
                  favouriteController.isFavourite ? Colors.red : Colors.grey,
            )),
          ),
          IconPage(
            text: "Mapa",
            icon: Icons.map,
            voidCallback: () =>
                mapTap(geoPoint,description, context),
          ),
          IconPage(
            text: "Compartilhar",
            icon: Icons.share,
            //voidCallback: () => _onShare(context,"https://firebasestorage.googleapis.com/v0/b/travelapp-a6b01.appspot.com/o/museu_da_agua%2Fthumb%2Fmuseu_da_agua1.jpg?alt=media&token=849cd2a4-8807-4a51-bfec-05cbc5e40962")
          ),
        ],
      ),
    );
  }

  favouriteTap(String id, int type) {
    favouriteController.isFavourite = !favouriteController.isFavourite;
    User user = userController.login;
    if (favouriteController.isFavourite)
      favouriteController.addFavourites(id, type, user);
    else
      favouriteController.removeFavourites(id, user);
  }

  mapTap(GeoPoint geoPoint, String description, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapPage(geoPoint: geoPoint,description: description,)),
    );
  }
}
