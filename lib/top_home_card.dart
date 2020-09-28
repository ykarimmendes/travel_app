import 'package:flutter/material.dart';

class TopHomeCard extends StatelessWidget {
  const TopHomeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, //altura do card principal
      child: ListView.builder(
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SizedBox(
            //height: 50,
            width: 250, //largura do card
            child: Card(
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top:5),
                      height: 150,
                      width: 225,
                      child: Card(
                        elevation: 5,
                        child: Image.asset(
                          "assets/museu_da_agua.jpeg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5, left: 10),
                    child: Text("Museu da Água", style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 2, left: 10),
                    child: Text("Museu dedicado à história do tratamento da água na cidade, em ponto com mirante coberto e vista panorâmica."),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10, left: 10),
                    child: Text("top #1 Museus"),
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