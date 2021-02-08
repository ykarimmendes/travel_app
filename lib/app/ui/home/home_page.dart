import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/home_controller.dart';
import 'package:travelapp/app/data/controller/login_controller.dart';
import 'package:travelapp/app/data/provider/home_api.dart';
import 'package:travelapp/app/data/provider/login_api.dart';
import 'package:travelapp/app/data/repository/home_repository.dart';
import 'package:travelapp/app/data/repository/login_repository.dart';


import 'widgets/app_bar_home.dart';

class HomePage extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetX<HomeController>(
      init: HomeController(HomeRepository(HomeApi())),
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