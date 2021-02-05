import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/restaurant_controller.dart';
import 'package:travelapp/app/data/model/restaurant.dart';
import 'package:travelapp/app/data/provider/restaurant_api.dart';
import 'package:travelapp/app/data/repository/restaurant_repository.dart';
import 'package:travelapp/app/ui/restaurants/restaurant_page.dart';

class RestaurantAll  extends GetView<RestaurantController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Restaurantos em Blumenau",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Color.fromRGBO(246, 246, 246, 1),
        padding: EdgeInsets.only(left: 10, right: 10, top: 5),
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GetX<RestaurantController>(
                init: RestaurantController(RestaurantRepository(RestaurantApi())),
                builder: (_) {
                  if (_.restaurantsList.length == 0) return LinearProgressIndicator();
                  return buildListView(context, _.restaurantsList);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListView buildListView(
      BuildContext context, List<Restaurant> atts) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: atts.map((e) => _buildSizedBox(context, e)).toList(),
    );
  }

  SizedBox _buildSizedBox(BuildContext context, Restaurant restaurant) {
    return SizedBox(
      height: 135,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RestaurantPage(restaurant)),
          );
        },
        child: Card(
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Image.network(
                          restaurant.image,
                          fit: BoxFit.cover,
                          width: 150,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        restaurant.title,
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 17),
                      ),
                      StatsLocation(),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        padding: const EdgeInsets.only(top: 6),
                        child: Text(
                          restaurant.title,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 3,
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, left: 50),
                        child: Text(
                          "5.95 Km de distância",
                          style: TextStyle(fontSize: 11),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatsLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.amber, size: 16),
        Icon(Icons.star, color: Colors.amber, size: 16),
        Icon(Icons.star, color: Colors.amber, size: 16),
        Icon(Icons.star, color: Colors.amber, size: 16),
        Icon(Icons.star, color: Colors.amber, size: 16),
      ],
    );
  }
}
