import 'package:flutter/material.dart';
import 'package:travelapp/intelligence_travel/intelligence_travel_page.dart';

class ButtonTravelIntelligence extends StatelessWidget {
  const ButtonTravelIntelligence({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30))),
      onPressed: () {
        print('You tapped on FlatButton');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => IntelligenceTravelPage()),
        );
      },
      textColor: Colors.white,
      color: Color.fromRGBO(54, 71, 88, 1),
      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            color: Color.fromRGBO(54, 71, 88, 1),
            child: Text(
              'Roteiro Inteligente',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Container(
            width: 100,
            child: Card(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              child: Icon(
                Icons.airplanemode_active,
                color: Color.fromRGBO(54, 71, 88, 1),
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}