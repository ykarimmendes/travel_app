import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/app/data/model/intelligence_travel.dart';
import 'package:travelapp/app/ui/widgets/custom_text.dart';

class IntelligenceTravelPage extends StatefulWidget {
  @override
  _IntelligenceTravelPageState createState() => _IntelligenceTravelPageState();
}

class _IntelligenceTravelPageState extends State<IntelligenceTravelPage> {
  IntelligenceTravel _intelligenceTravel = IntelligenceTravel();
  List<IntelligenceTravel> _ies = List<IntelligenceTravel>();
  int _totalSelected = 0;
  double _totalDistance = 0.0;

  void _handleTap(int index) {
    setState(() {
      _ies[index].check = !_ies[index].check;
      _totalSelected = _ies.where((element) => element.check).length;

      if (_ies[index].check) {
        _totalDistance += _ies[index].distance;
      } else
        _totalDistance -= _ies[index].distance;
    });

  }

  @override
  Widget build(BuildContext context) {
    final double imageWidth = MediaQuery.of(context).size.width;
    final Color backgroundColor = Colors.grey[200];

    if (_ies.length == 0) _ies = _intelligenceTravel.mock();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        title: CText(
          text: "Escolha seu roteiro",
          fontSize: 17,
          fontFamily: "LibreBaskerville",
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: backgroundColor,
          padding: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          child: Column(
            children: <Widget>[
              Container(
                color: backgroundColor,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _ies.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(top: 10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            elevation: 8,
                            clipBehavior: Clip.antiAlias,
                            child: Image.asset(
                              _ies[index].photo,
                              fit: BoxFit.cover,
                              width: imageWidth,
                              height: 190,
                            ),
                          ),
                          Positioned(
                            bottom: 15,
                            left: 15,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              height: 35,
                              width: imageWidth - (imageWidth * 0.25),
                              color: Color.fromRGBO(0, 0, 0, 0.4),
                              child: CText(
                                text: _ies[index].name.toUpperCase(),
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                                fontFamily: "LibreBaskerville",
                              ),
                            ),
                          ),
                          Positioned(
                            top: 20,
                            right: imageWidth / 13,
                            child: Container(
                              width: 30,
                              height: 30,
                              color: _ies[index].check
                                  ? Colors.green
                                  : Colors.white,
                              child: IconButton(
                                icon: _ies[index].check
                                    ? Icon(Icons.check, color: Colors.white)
                                    : Icon(Icons.add, color: Colors.grey),
                                color: Colors.white,
                                iconSize: 30,
                                padding: EdgeInsets.all(0),
                                onPressed: () {
                                  _handleTap(index);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Text("LUGARES:"),
            title: Text("$_totalSelected Selecionados"),
          ),
          BottomNavigationBarItem(
            icon: Text("DISTÂNCIA"),
            title: Text("${_totalDistance.toStringAsFixed(2)} KM"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chevron_right),
            title: Text("CONFIRMAR"),
          ),
        ],
      ),
    );
  }
}
