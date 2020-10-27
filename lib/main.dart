import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home/app_bar_home.dart';
import 'home/attractions/top_home_card.dart';
import 'home/filter_home.dart';
import 'home/restaurants/restaurants_home_cards.dart';
import 'home/stories/stories_home_card.dart';
import 'home/stories/stories_home_text.dart';
import 'home/travel_intelligence_button.dart';
import 'widgets/home_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBarWidget(),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            color: Color.fromRGBO(246, 246, 246, 1),
            padding: EdgeInsets.only(left: 10, right: 10),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  FilterHome(),
                  StoriesHomeText(),
                  StoriesHomeCard(),
                  HomeText("Atrações em Destaque"),
                  TopHomeCard(),
                  HomeText("Bares e Restaurantes"),
                  RestaurantsHomeCards(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            width: 280,
            height: 50,
            child: ButtonTravelIntelligence(),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Inicial'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Favoritos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('Rotas'),
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.amber[800],
      ),
    );
  }
}
