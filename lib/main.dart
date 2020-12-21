import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/bindings/event_biding.dart';
import 'app/ui/atracctions/attractions_all.dart';
import 'app/ui/home/app_bar_home.dart';
import 'app/ui/home/events_home_card.dart';
import 'app/ui/home/filter_home.dart';
import 'app/ui/home/main_home_attractions.dart';
import 'app/ui/home/restaurants_home_cards.dart';
import 'app/ui/intelligente_travel/intelligence_travel_page.dart';
import 'app/ui/theme/utils.dart';
import 'app/ui/widgets/title_text.dart';

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
    return GetMaterialApp(
      initialBinding: EventBiding(),
      home: Scaffold(
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
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    if (_currentIndex == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IntelligenceTravelPage()),
      );
    }
  }
}
