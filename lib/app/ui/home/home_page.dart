import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/attraction_controller.dart';
import 'package:travelapp/app/data/controller/home_controller.dart';

import 'widgets/app_bar_home.dart';

class HomePage extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
        builder: (_){
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: AppBarWidget(),
            ),
            body: HomeController.to.currentPage,
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0,
              currentIndex: HomeController.to.currentIndex.value,
              onTap: HomeController.to.changePage,
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
        },
    );
  }
}