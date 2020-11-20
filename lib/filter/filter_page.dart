import 'package:flutter/material.dart';
import 'package:travelapp/widgets/home_text.dart';

import 'filter.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  Filter filter = Filter();
  List<Filter> filters;

  void _handleTap(int index) {
    setState(() {
      filters[index].clicked = !filters[index].clicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (filters == null || filters.length == 0) {
      filters = List<Filter>();
      filters = filter.mock();
    }

    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text(
          "Busca",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 11, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: TextField(
                  autofocus: false,
                  cursorColor: Colors.black,
                  style: TextStyle(
                    height: 1.5,
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(1),
                    prefixIcon: Icon(
                      Icons.location_on,
                      color: Colors.black,
                    ),
                    hintText: "Pra onde?",
                    enabledBorder: outlineInputBorder,
                    focusedBorder: outlineInputBorder,
                  ),
                ),
              ),
              HomeText(
                  text: "Quais Seus Interesses?", renderMore: false, top: 10),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                ),
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      _handleTap(index);
                    },
                    child: GButton(
                      text: filters[index].description,
                      icon: filters[index].icon,
                      clicked: filters[index].clicked,
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: FlatButton(
                  color: Color.fromRGBO(37, 145, 140, 1),
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  padding: EdgeInsets.all(15),
                  onPressed: () {
                    /*...*/
                  },
                  child: Text(
                    "Pesquisar",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool clicked;

  GButton({this.text, this.icon, this.clicked});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
            size: 40,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500),
          )
        ],
      ),
      color: clicked ? Colors.green[700] : Colors.grey[600],
    );
  }
}
