import 'package:flutter/material.dart';

import 'attraction.dart';

class TopHomeCard extends StatelessWidget {
  const TopHomeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const ALTURA_CARD_PRINCIPAL = 260.0;
    const LARGURA_CARD_IMAGEM = 280.0;

    Attraction att = new Attraction();
    List<Attraction> atts = att.mock();

    return Container(
      height: ALTURA_CARD_PRINCIPAL,
      child: ListView.builder(
        itemCount: atts.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            width: LARGURA_CARD_IMAGEM,
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
                        child: Image.asset(
                          atts[index].photoLink,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 10),
                    child: Text(
                      atts[index].name,
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2, left: 10, right: 8),
                    child: Text(
                        atts[index].description),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 10),
                    child: Text(
                      atts[index].topDescription,
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
