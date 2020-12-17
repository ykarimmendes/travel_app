import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/app/data/model/collection_enum.dart';
import 'package:travelapp/app/data/model/event.dart';
import 'package:travelapp/app/ui/theme/utils.dart';
import 'package:travelapp/app/ui/widgets/back_icon_page.dart';
import 'package:travelapp/app/ui/widgets/custom_text.dart';
import 'package:travelapp/app/ui/widgets/icons_page.dart';
import 'package:travelapp/app/ui/widgets/photo_page.dart';
import 'package:travelapp/app/ui/widgets/title_page_text.dart';
import 'package:travelapp/app/ui/widgets/topic_text.dart';

class EventPage extends StatefulWidget {
  final Event event;
  EventPage(this.event);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    final Event _event = widget.event;
    return Scaffold(
      backgroundColor: Util.background,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(
            leading: BackIconPage(),
            automaticallyImplyLeading: true,
            forceElevated: true,
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height / 3,
            flexibleSpace: Image.network(
              _event.photoCover,
              fit: BoxFit.cover,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    NameLocation(_event),
                    DescriptionLocation(_event),
                    TopicText("Fotos"),
                    PhotosPage(_event.reference.id,
                        describeEnum(CollectionEnum.events))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionLocation extends StatelessWidget {
  final Event _event;
  DescriptionLocation(this._event);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TopicText("Informações"),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
        ),
        CText(
          text: _event.date,
          height: 1.4,
          maxLines: 5,
          textAlign: TextAlign.justify,
        ),
        CText(
          text:
              "${_event.address.address}, ${_event.address.number} - ${_event.address.neighborhood}",
          height: 1.8,
          maxLines: 5,
          textAlign: TextAlign.justify,
        ),
        TopicText("Sobre"),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 10.0),
          child: CText(
            text: _event.about,
            height: 1.4,
            maxLines: 5,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class NameLocation extends StatelessWidget {
  final Event _event;
  NameLocation(this._event);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        LocationName(_event.category),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TitlePageText(_event.title),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconPage(text: "Favorito", icon: Icons.favorite),
              IconPage(text: "Mapa", icon: Icons.map),
              IconPage(text: "Compartilhar", icon: Icons.share),
            ],
          ),
        ),
      ],
    );
  }
}

class LocationName extends StatelessWidget {
  final String _category;

  LocationName(this._category);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.location_on,
          color: Colors.grey,
          size: 15,
        ),
        CText(
          text: _category,
          color: Colors.grey,
          fontSize: 15,
        ),
      ],
    );
  }
}
