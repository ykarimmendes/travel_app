import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/attraction_controller.dart';
import 'package:travelapp/app/ui/atracctions/attractions_all.dart';
import 'package:travelapp/app/ui/theme/utils.dart';
import 'package:travelapp/app/ui/widgets/title_text.dart';

import 'widgets/app_bar_home.dart';
import 'widgets/events_home_card.dart';
import 'widgets/filter_home.dart';
import 'widgets/main_home_attractions.dart';
import 'widgets/restaurants_home_cards.dart';

class HomePage extends GetView<EventController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBarWidget(),
      ),
      body: Container(
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
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        //TODO
        //onTap: onTabTapped,
        currentIndex: 1, //_currentIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inicial'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favoritos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text('Rotas Inteligentes'),
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}