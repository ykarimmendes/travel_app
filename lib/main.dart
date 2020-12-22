import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/bindings/event_biding.dart';
import 'package:travelapp/app/bindings/home_biding.dart';
import 'package:travelapp/app/ui/home/home_page.dart';
import 'app/ui/intelligente_travel/intelligence_travel_page.dart';

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
      initialBinding: HomeBiding(),
      home: HomePage(),
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
