
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travelapp/app/data/controller/event_controller.dart';
import 'package:travelapp/app/data/provider/event_api.dart';
import 'package:travelapp/app/data/repository/event_repository.dart';
import 'package:travelapp/app/ui/events/event_page.dart';
import 'package:travelapp/app/ui/widgets/card_text.dart';
import 'package:travelapp/app/ui/widgets/card_title.dart';

class EventsHomeCard extends GetView<EventController> {
  @override
  Widget build(BuildContext context) {

    return GetX<EventController>(
      initState: (state){Get.find<EventController>().getAll();},
      init: EventController(EventRepository(EventApi())),
      builder: (_) {
        if (_.eventsList.length == 0) return LinearProgressIndicator();
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EventPage(_.eventsList[0])),
            );
          },
          child: Container(
            height: 160,
            child: Card(
              elevation: 5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 140,
                    width: 125,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        _.eventsList[0].photoCoverThumb,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top: 8, left: 6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CardTitle(_.eventsList[0].title),
                          SizedBox(height: 8),
                          Text(
                            _.eventsList[0].title,
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4),
                          Flexible(
                            child: CardText(
                              _.eventsList[0].resume,
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
      },
    );
  }
}
