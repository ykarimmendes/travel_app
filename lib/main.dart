import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/home/events/events_home_card.dart';
import 'package:travelapp/util/utils.dart';

import 'home/app_bar_home.dart';
import 'home/filter_home.dart';
import 'home/main_attractions/top_home_card.dart';
import 'home/restaurants/restaurants_home_cards.dart';
import 'intelligence_travel/intelligence_travel_page.dart';
import 'widgets/title_text.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
  int _currentIndex = 0;
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
              TitleText(text: "Eventos de Blumenau"),
              EventsHomeCard(),
              TitleText(text:"Lugares para Conhecer"),
              TopHomeCard(),
              TitleText(text:"Bares e Restaurantes"),
              RestaurantsHomeCards(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
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
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (_currentIndex == 2){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntelligenceTravelPage()),
      );
    }

  }
}
