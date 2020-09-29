import 'package:flutter/material.dart';

class RestaurantsHomeCards extends StatelessWidget {
  const RestaurantsHomeCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Container(
            height: 120,
            child: Card(
              elevation: 3,
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                        child: Image.asset(
                          "assets/restaurante1.jpg",
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        clipBehavior: Clip.antiAlias,
                      ),
                    ],
                  ),
                  Column(

                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, bottom: 10),
                        child: Text(
                          "Hangoo Restaurante",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: ListTile(

                          dense: true,
                          title: Text("Buffet Livre"),
                          subtitle: Text(
                              "Churrasco, Pizzas, Sobremesas, Sorvetes"),
                        ),
                      ),
                    ],
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