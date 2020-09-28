import 'package:flutter/material.dart';

class StoriesHomeCard extends StatelessWidget {
  const StoriesHomeCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: Card(
          elevation: 5,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 5),
                width: 100,
                height: 140,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 5,
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    "assets/blumenau1.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 8, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Oktoberfest Blumenau 2019",
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 16),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Festival de Tradições",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 4),
                    Container(
                      width: 200,
                      child: Text(
                        'A Oktoberfest de Blumenau é um festival de tradições germânicas',
                        overflow: TextOverflow.clip,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}