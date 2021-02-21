import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/favourite_controller.dart';
import 'package:travelapp/app/data/controller/login_controller.dart';
import 'package:travelapp/app/data/model/address.dart';
import 'package:travelapp/app/data/model/attraction.dart';
import 'package:travelapp/app/data/model/collection_enum.dart';
import 'package:travelapp/app/data/model/user/user.dart';
import 'package:travelapp/app/data/provider/favourite_api.dart';
import 'package:travelapp/app/data/provider/login_api.dart';
import 'package:travelapp/app/data/repository/favourite_repository.dart';
import 'package:travelapp/app/data/repository/login_repository.dart';
import 'package:travelapp/app/ui/widgets/back_icon_page.dart';
import 'package:travelapp/app/ui/widgets/custom_text.dart';
import 'package:travelapp/app/ui/widgets/icons_page.dart';
import 'package:travelapp/app/ui/widgets/photo_page.dart';
import 'package:travelapp/app/ui/widgets/title_page_text.dart';
import 'package:travelapp/app/ui/widgets/topic_text.dart';

class AttractionPage extends StatelessWidget {
  final Attraction _att;

  AttractionPage(this._att);

  final favouriteController =
      Get.put(FavouriteController(FavouriteRepository(FavouriteApi())));
  final userController =
  Get.put(LoginController(LoginRepository(LoginApi())));

  @override
  Widget build(BuildContext context) {
    _att.isFavourite = favouriteController.getIsFavourite(_att.reference.id);

    return StreamBuilder<QuerySnapshot>(
        stream: getAddress(_att),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return LinearProgressIndicator();
          return Scaffold(
            body: CustomScrollView(
              shrinkWrap: true,
              slivers: <Widget>[
                SliverAppBar(
                  leading: BackIconPage(),
                  automaticallyImplyLeading: true,
                  forceElevated: true,
                  floating: false,
                  flexibleSpace: Image.network(
                    _att.photoCover,
                    fit: BoxFit.cover,
                  ),
                  expandedHeight: MediaQuery.of(context).size.height / 3,
                ),
                SliverToBoxAdapter(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Color.fromRGBO(242, 241, 243, 0),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          nameLocation(
                              _att,
                              new Address.fromSnapshot(
                                  snapshot.data.docs.first)),
                          DescriptionLocation(_att),
                          TopicText("Fotos"),
                          PhotosPage(_att.reference.id,
                              describeEnum(CollectionEnum.attractions)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  nameLocation(Attraction _att, Address _add) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        LocationName(_att),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TitlePageText(_att.title),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 3),
                child: StatsLocation(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CText(
            text: "${_add.address},${_add.number} - ${_add.neighborhood}",
            fontSize: 16,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => favouriteTap(_att.reference.id),
                child: Obx(
                  () => (IconPage(
                    text: "Favorito",
                    icon: Icons.favorite,
                    iconColor: favouriteController.isFavourite
                        ? Colors.red
                        : Colors.grey,
                  )),
                ),
              ),
              IconPage(text: "Mapa", icon: Icons.map),
              IconPage(text: "Compartilhar", icon: Icons.share),
            ],
          ),
        ),
      ],
    );
  }

  favouriteTap(String id) {
    favouriteController.isFavourite = !favouriteController.isFavourite;
    User user = userController.login;
    if (favouriteController.isFavourite)
      favouriteController.addFavourites(id, 1, user);
    else
      favouriteController.removeFavourites(id, user);


  }

  getAddress(Attraction att) {
    final FirebaseFirestore _fb = FirebaseFirestore.instance;
    return _fb
        .collection('attractions')
        .doc(att.reference.id)
        .collection('address')
        .snapshots();
  }
}

class DescriptionLocation extends StatelessWidget {
  final Attraction att;

  DescriptionLocation(this.att);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TopicText("Sobre"),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 10.0),
          child: CText(
            text: att.about,
            height: 1.4,
            maxLines: 5,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class StatsLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
      ],
    );
  }
}

class LocationName extends StatelessWidget {
  final Attraction _att;

  LocationName(this._att);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.grey,
          size: 15,
        ),
        CText(
          text: _att.category,
          color: Colors.grey,
          fontSize: 15,
        ),
      ],
    );
  }
}
