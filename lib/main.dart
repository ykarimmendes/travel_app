import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/app_bar_home.dart';

import 'package:travelapp/stories_home_card.dart';
import 'package:travelapp/stories_home_text.dart';
import 'package:travelapp/attractions/top_home_card.dart';

import 'filter_home.dart';
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
      body: Container(
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: ListView(
                  shrinkWrap: true,
              children: <Widget>[
                FilterHome(),
                StoriesHomeText(),
                StoriesHomeCard(),
                HomeText("Atrações em Destaque"),
                TopHomeCard(),
                HomeText("Bares e Restaurantes"),
                Container(
                  height: 400,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 120,
                        child: Card(
                          elevation: 3,
                          child: Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/restaurante1.jpg",
                                    height: 100,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0, bottom: 10),
                                    child: Text(
                                      "Hangoo Restaurante",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16),
                                    ),
                                  ),
                                  SizedBox(

                                    width: 200,
                                    child: ListTile(
                                      dense: true,
                                      title: Text("Buffet Livre"),
                                      subtitle:
                                          Text("Churrasco, Pizzas, Sobremesas, Sorvetes"),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
          ],
        ),
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
