import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/restaurant_controller.dart';
import 'package:travelapp/app/data/model/restaurant.dart';
import 'package:travelapp/app/data/provider/restaurant_api.dart';
import 'package:travelapp/app/data/repository/restaurant_repository.dart';
import 'package:travelapp/app/ui/restaurants/restaurant_page.dart';
import 'package:travelapp/app/ui/widgets/card_title.dart';

class RestaurantsHomeCards extends StatelessWidget {
  const RestaurantsHomeCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<RestaurantController>(
      initState: (state){Get.find<RestaurantController>().getAll();},
      init: RestaurantController(RestaurantRepository(RestaurantApi())),
      builder: (_) {
        if (_.restaurantsList.length == 0) return LinearProgressIndicator();
        return _buildList(context, _.restaurantsList);
      },
    );
  }
}

  Widget _buildList(BuildContext context, List<Restaurant> snapshot) {
  return ListView(
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    children: snapshot.map((e) => _buildListItem(context, e)).toList(),
  );
}

Widget _buildListItem(BuildContext context, Restaurant restaurant) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RestaurantPage(restaurant),)
      );
    },
    child: Card(
      elevation: 3,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  child: Image.asset(
                    "assets/${restaurant.image}",
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  clipBehavior: Clip.antiAlias,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(
                      left: 15.0,
                    ),
                    child: CardTitle(restaurant.title)),
                ListTile(
                  isThreeLine: true,
                  dense: true,
                  title: Text(
                    restaurant.category,
                    style: TextStyle(fontSize: 15, fontFamily: "BreeSerif"),
                  ),
                  subtitle: Text(
                    restaurant.sub.join(' , '),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
