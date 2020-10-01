import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_text.dart';

class MainAttractions extends StatefulWidget {
  @override
  _MainAttractionsState createState() => _MainAttractionsState();
}

class _MainAttractionsState extends State<MainAttractions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.asset(
              "assets/museu_da_agua.jpeg",
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      CText(
                        text: "Museu",
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CText(
                      text: "Museu da Água",
                      fontSize: 21,
                      fontFamily: "LibreBaskerville",
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8, top: 10),
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                        Icon(Icons.star, color: Colors.amber, size: 20),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: <Widget>[
                        CText(
                         text: "O Museu da Água de Blumenau é um museu localizado no bairro da Boa Vista, na cidade de Blumenau. O espaço é mantido pela SEMAE (Serviço Autônomo Municipal de água e esgoto) e está localizado justamente na primeira estação de tratamento de água da cidade, inaugurada em 1940 e transformada em local de visitação em 1999.[1] No local, o visitante pode conhecer os processos de coleta e purificação da água, além de ter acesso a um acervo com peças, equipamentos e documentos que recontam um pouco da história do abastecimento de água na cidade.[2] No Réveillon, o local também é usado como ponto para a queima de fogos na cidade.[3]",
                          height: 1.4,
                          maxLines: 5,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:18),
                    child: CText(
                      text:"Fotos",
                      fontWeight:
                      FontWeight.w900,
                      fontSize: 17,
                      fontFamily: "LibreBaskerville",
                    ),
                  ),
                  Container(
                    height: 450,
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.redAccent,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
