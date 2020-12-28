import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/repository/home_repository.dart';
import 'package:travelapp/app/ui/atracctions/attractions_all.dart';
import 'package:travelapp/app/ui/home/widgets/events_home_card.dart';
import 'package:travelapp/app/ui/home/widgets/filter_home.dart';
import 'package:travelapp/app/ui/home/widgets/main_home_attractions.dart';
import 'package:travelapp/app/ui/home/widgets/restaurants_home_cards.dart';
import 'package:travelapp/app/ui/theme/utils.dart';
import 'package:travelapp/app/ui/widgets/title_text.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  HomeController(this._repository);

  static HomeController get to => Get.find();

  final currentIndex = 0.obs;

  Widget get currentPage => pages[currentIndex.value];

  List<Widget> pages = [
    Container(
      color: Util.background,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FilterHome(),
            TitleText(
              text: "Eventos de Blumenau",
              methodCallBack: AttractionAll(),
            ),
            EventsHomeCard(),
            TitleText(
              text: "Lugares para Conhecer",
              methodCallBack: AttractionAll(),
            ),
            MainHomeAttractions(),
            TitleText(
              text: "Bares e Restaurantes",
              methodCallBack: AttractionAll(),
            ),
            RestaurantsHomeCards(),
          ],
        ),
      ),
    ),
    Container(color: Colors.blue,),
    Container(color: Colors.red,),
    Container(color: Colors.blue,),
  ];

  void changePage(int _index) {
    currentIndex.value = _index;
  }
}
