import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/photo_attractions/main_photo_attraction.dart';
import 'package:travelapp/widgets/custom_text.dart';

class MainAttractions extends StatefulWidget {
  @override
  _MainAttractionsState createState() => _MainAttractionsState();
}

class _MainAttractionsState extends State<MainAttractions> {
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
            flexibleSpace: Image.asset(
              "assets/museu_da_agua.jpeg",
              fit: BoxFit.cover,
            ),
            expandedHeight: MediaQuery.of(context).size.height / 3,
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
        PhotosTextLocation("Sobre"),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 10.0),
          child: CText(
            text:
                "O Museu da Água de Blumenau é um museu localizado no bairro da Boa Vista, na cidade de Blumenau. O espaço é mantido pela SEMAE (Serviço Autônomo Municipal de água e esgoto) e está localizado justamente na primeira estação de tratamento de água da cidade, inaugurada em 1940 e transformada em local de visitação em 1999.[1] No local, o visitante pode conhecer os processos de coleta e purificação da água, além de ter acesso a um acervo com peças, equipamentos e documentos que recontam um pouco da história do abastecimento de água na cidade.[2] No Réveillon, o local também é usado como ponto para a queima de fogos na cidade.[3]",
            height: 1.4,
            maxLines: 5,
            textAlign: TextAlign.justify,
          ),
        ),
      ],
    );
  }
}

class StatsLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
        Icon(Icons.star, color: Colors.amber, size: 20),
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
                text: "Museu da Água",
                fontSize: 25,
                fontFamily: "LibreBaskerville",
                fontWeight: FontWeight.w900,
                color: Color.fromRGBO(54, 71, 88, 1),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 3),
                child: StatsLocation(),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: CText(
            text: "R. Lages, s/n - Boa Vista",
            fontSize: 17,
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
          text: "Museu",
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
