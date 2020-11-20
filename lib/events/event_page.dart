import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/photo_attractions/main_photo_attraction.dart';
import 'package:travelapp/widgets/custom_text.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: <Widget>[
          SliverAppBar(

            automaticallyImplyLeading: true,
            forceElevated: true,
            floating: false,
            expandedHeight: MediaQuery.of(context).size.height / 3,
            flexibleSpace: Image.asset(
              "assets/blumenau1.jpg",
              fit: BoxFit.cover,
            ),

          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Color.fromRGBO(242, 241, 243, 0),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    NameLocation(),
                    DescriptionLocation(),
                    PhotosTextLocation("Fotos"),
                    PhotosLocation(),
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

class PhotosTextLocation extends StatelessWidget {
  final String text;

  PhotosTextLocation(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: CText(
        text: text,
        fontWeight: FontWeight.w900,
        color: Color.fromRGBO(54, 71, 88, 1),
        fontSize: 17,
        fontFamily: "LibreBaskerville",
      ),
    );
  }
}

class DescriptionLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        PhotosTextLocation("Informações"),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
        ),
        CText(
          text: "2 de Outubro até 23 de Outubro",
          height: 1.4,
          maxLines: 5,
          textAlign: TextAlign.justify,
        ),
        CText(
          text: "R. Alberto Stein, 165-249 - Velha",
          height: 1.8,
          maxLines: 5,
          textAlign: TextAlign.justify,
        ),
        PhotosTextLocation("Sobre"),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 10.0),
          child: CText(
            text:
                "A Oktoberfest de Blumenau é um festival de tradições germânicas que ocorre na cidade de Blumenau em Santa Catarina durante o mês de outubro. Ela é uma das celebrações que surgiram no mundo similares à Oktoberfest de Munique, na Alemanha. Em alemão, Oktober significa outubro, e Fest festa ou festival.",
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        LocationName(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CText(
                text: "Oktoberfest 2019",
                fontSize: 25,
                fontFamily: "LibreBaskerville",
                fontWeight: FontWeight.w900,
                color: Color.fromRGBO(54, 71, 88, 1),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MainAttractionIcons(text: "Favorito", icon: Icons.favorite),
              MainAttractionIcons(text: "Mapa", icon: Icons.map),
              MainAttractionIcons(text: "Compartilhar", icon: Icons.share),
            ],
          ),
        ),
      ],
    );
  }
}

class LocationName extends StatelessWidget {
  const LocationName({
    Key key,
  }) : super(key: key);

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
          text: "Festival",
          color: Colors.grey,
          fontSize: 15,
        ),
      ],
    );
  }
}

class PhotosLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 12),
      physics: NeverScrollableScrollPhysics(),
      itemCount: 7,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainPhotoAttraction(index)),
            );
          },
          child: Card(
            elevation: 4,
            child: Image.asset(
              "assets/museu/m$index.jpg",
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}

class MainAttractionIcons extends StatelessWidget {
  final IconData icon;
  final String text;
  Color color;

  MainAttractionIcons({@required this.text, @required this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    if (color == null) color = Colors.grey[500];

    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: color,
        ),
        SizedBox(
          height: 15,
        ),
        CText(
          text: text,
          fontSize: 17,
        ),
      ],
    );
  }
}
