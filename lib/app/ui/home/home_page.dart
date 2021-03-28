import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/favourite_controller.dart';
import 'package:travelapp/app/data/controller/home_controller.dart';
import 'package:travelapp/app/data/controller/login_controller.dart';
import 'package:travelapp/app/data/provider/favourite_api.dart';
import 'package:travelapp/app/data/provider/home_api.dart';
import 'package:travelapp/app/data/provider/login_api.dart';
import 'package:travelapp/app/data/repository/favourite_repository.dart';
import 'package:travelapp/app/data/repository/home_repository.dart';
import 'package:travelapp/app/data/repository/login_repository.dart';


import 'widgets/app_bar_home.dart';

class HomePage extends  StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GetX<HomeController>(
      init: HomeController(HomeRepository(HomeApi())),
      builder: (_){
        //TODO Refatorar essa merda
          final loginController = Get.put(LoginController(LoginRepository(LoginApi())));
          final favouriteController = Get.put(FavouriteController(FavouriteRepository(FavouriteApi())));
          favouriteController.getFavouritesByUser(loginController.login).listen((event) { });

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
              ],
              selectedItemColor: Colors.amber[800],
            ),
          );
        },
    );
  }
}