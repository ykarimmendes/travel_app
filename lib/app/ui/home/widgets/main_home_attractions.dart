import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/attraction_controller.dart';
import 'package:travelapp/app/data/model/attraction.dart';
import 'package:travelapp/app/data/provider/attraction_api.dart';
import 'package:travelapp/app/data/repository/attraction_repository.dart';
import 'package:travelapp/app/ui/atracctions/attraction_page.dart';
import 'package:travelapp/app/ui/widgets/card_text.dart';
import 'package:travelapp/app/ui/widgets/card_title.dart';

class MainHomeAttractions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<AttractionController>(
      initState: (state){Get.find<AttractionController>().getAll();},
      init: AttractionController(AttractionRepository(AttractionApi())),
      builder: (_) {
        if (_.attractionsList.length == 0) return LinearProgressIndicator();
        return _buildList(context, _.attractionsList);
      },
    );
  }
}

Widget _buildList(BuildContext context, List<Attraction> attractions) {
  return SizedBox(
    height: 260,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: attractions.map((data) => _buildListItem(context, data)).toList(),
    ),
  );
}

Widget _buildListItem(BuildContext context, Attraction att) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AttractionPage(att),
          ));
    },
    child: SizedBox(
      width: 280.0,
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                padding: EdgeInsets.only(top: 5),
                height: 150,
                width: 260,
                child: Card(
                  elevation: 5,
                  child: Image.network(
                    att.photoCoverThumb,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5, left: 10),
              child: CardTitle(att.title),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2, left: 10, right: 8),
              child: CardText(att.resume),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                "Top #${att.top} Museus",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
