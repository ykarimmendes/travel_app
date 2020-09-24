import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/app_bar_home.dart';

import 'package:travelapp/stories_home_card.dart';
import 'package:travelapp/stories_home_text.dart';
import 'package:travelapp/top_home_card.dart';
import 'package:travelapp/top_home_text.dart';

import 'filter_home.dart';

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
            FilterHome(),
            StoriesHomeText(),
            StoriesHomeCard(),
            TopHomeText(),
            TopHomeCard(),
          ],
        ),
      ),
      bottomNavigationBar:   BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.amber[800],

      ),
    );
  }
}
