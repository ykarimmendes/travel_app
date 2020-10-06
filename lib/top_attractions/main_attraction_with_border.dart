//Essa classe tem o projeto com atracao com borda

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_text.dart';

import 'main_attraction.dart';

class MainAttractions extends StatefulWidget {
  @override
  _MainAttractionsState2 createState() => _MainAttractionsState2();
}

class _MainAttractionsState2 extends State<MainAttractions> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height+300,
          ),
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/museu_da_agua.jpeg",
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.height/1.60,
            ),
          ),
          Positioned(
              top: MediaQuery.of(context).size.width/1.63,
              child : Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),color: Colors.white
                ),
              )
          ),
          Positioned(
            top: (MediaQuery.of(context).size.width/1.63)+15,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  LocationName(),
                  NameLocation(),
                  StatsLocation(),
                  DescriptionLocation(),
                  PhotosTextLocation(),
                  PhotosLocation(),
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}

class _MainAttractionsState extends State<MainAttractions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "assets/museu_da_agua.jpeg",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  LocationName(),
                  NameLocation(),
                  StatsLocation(),
                  DescriptionLocation(),
                  PhotosTextLocation(),
                  PhotosLocation(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PhotosLocation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 12),
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Image.asset(
              "assets/museu/m$index.jpg",
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class DescriptionLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,

      padding: const EdgeInsets.only(top: 15.0),
      child: CText(
        text:
        "O Museu da Água de Blumenau é um museu localizado no bairro da Boa Vista, na cidade de Blumenau. O espaço é mantido pela SEMAE (Serviço Autônomo Municipal de água e esgoto) e está localizado justamente na primeira estação de tratamento de água da cidade, inaugurada em 1940 e transformada em local de visitação em 1999.[1] No local, o visitante pode conhecer os processos de coleta e purificação da água, além de ter acesso a um acervo com peças, equipamentos e documentos que recontam um pouco da história do abastecimento de água na cidade.[2] No Réveillon, o local também é usado como ponto para a queima de fogos na cidade.[3]",
        height: 1.4,
        maxLines: 5,
      ),
    );
  }
}

class StatsLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 7),
      child: Row(
        children: <Widget>[
          Icon(Icons.star, color: Colors.amber, size: 20),
          Icon(Icons.star, color: Colors.amber, size: 20),
          Icon(Icons.star, color: Colors.amber, size: 20),
          Icon(Icons.star, color: Colors.amber, size: 20),
          Icon(Icons.star, color: Colors.amber, size: 20),
        ],
      ),
    );
  }
}

class NameLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: CText(
        text: "Museu da Água",
        fontSize: 22,
        fontFamily: "LibreBaskerville",
        fontWeight: FontWeight.w900,
      ),
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
