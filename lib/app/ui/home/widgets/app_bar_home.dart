import 'package:flutter/material.dart';
import 'package:travelapp/app/ui/filter/filter_page.dart';
import 'package:travelapp/app/ui/theme/utils.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return AppBar(

      backgroundColor: Util.background,
      flexibleSpace: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FilterPage()),
          );
        },
        child: Container(
          height: 100,
          padding: EdgeInsets.only(top: 40, left: 10, right: 10),
          child: Card(
            shadowColor: Colors.grey,
            elevation: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text("Busca", style: TextStyle(fontSize: 16, color: Colors.grey),),
                ),
              ],
            ),
          ),
        ),
      ),
      elevation: 0,
    );
  }
}
