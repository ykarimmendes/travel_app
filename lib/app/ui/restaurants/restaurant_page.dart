import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/app/data/model/collection_enum.dart';
import 'package:travelapp/app/data/model/restaurant.dart';
import 'package:travelapp/app/ui/social_media/social_media_page.dart';
import 'package:travelapp/app/ui/theme/utils.dart';
import 'package:travelapp/app/ui/widgets/back_icon_page.dart';
import 'package:travelapp/app/ui/widgets/custom_text.dart';
import 'package:travelapp/app/ui/widgets/photo_page.dart';
import 'package:travelapp/app/ui/widgets/title_page_text.dart';
import 'package:travelapp/app/ui/widgets/topic_text.dart';

class RestaurantPage extends StatefulWidget {
  final Restaurant _restaurant;

  RestaurantPage(this._restaurant);

  @override
  _RestaurantPageState createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> {
  @override
  Widget build(BuildContext context) {
    final Restaurant _restaurant = widget._restaurant;
    return Scaffold(
      backgroundColor: Util.background,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            leading: BackIconPage(),
            automaticallyImplyLeading: true,
            forceElevated: true,
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height / 3,
            flexibleSpace: Image.asset(
              "assets/restaurante1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(242, 241, 243, 0),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    nameLocation(_restaurant),
                    descriptionLocation(_restaurant, context),
                    photosTextLocation("Fotos"),
                    PhotosPage(_restaurant.reference.id,
                        describeEnum(CollectionEnum.business)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  photosTextLocation(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: CText(
        text: text,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(54, 71, 88, 1),
        fontSize: 17,
        fontFamily: "LibreBaskerville",
      ),
    );
  }

  descriptionLocation(Restaurant _restaurant, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TopicText("Sobre"),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 10.0),
          child: CText(
            text: _restaurant.about,
            height: 1.4,
            maxLines: 5,
            textAlign: TextAlign.justify,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SocialMediaPage(_restaurant.getAllSocialMedia()),
        ),
      ],
    );
  }

  nameLocation(Restaurant _restaurant) {
    @override
    Widget build(BuildContext context) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          locationName(),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TitlePageText(_restaurant.title),
              ],
            ),
          ),
          CText(
            text:
                "${_restaurant.address.address}, ${_restaurant.address.number} - ${_restaurant.address.neighborhood}",
            height: 1.8,
            maxLines: 5,
            textAlign: TextAlign.justify,
          ),
          CText(
            text: _restaurant.openingHour,
            height: 1.4,
            maxLines: 5,
            textAlign: TextAlign.justify,
            fontSize: 13,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                mainAttractionIcons("Favorito", Icons.favorite, null),
                mainAttractionIcons("Mapa", Icons.map, null),
                mainAttractionIcons("Compartilhar", Icons.share, null),
              ],
            ),
          ),
        ],
      );
    }
  }

  locationName() {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.grey,
          size: 15,
        ),
        CText(
          text: "Buffet e Pizzas",
          color: Colors.grey,
          fontSize: 15,
        ),
      ],
    );
  }
}

mainAttractionIcons(String text, IconData icon, Color color) {
  if (color == null) color = Colors.grey[500];

  return Column(
    children: <Widget>[
      Icon(
        icon,
        color: color,
      ),
      SizedBox(
        height: 15,
      ),
      CText(
        text: text,
        fontSize: 17,
      ),
    ],
  );
}
