import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelapp/app/data/controller/attraction_controller.dart';
import 'package:travelapp/app/data/provider/attraction_api.dart';
import 'package:travelapp/app/data/repository/attraction_repository.dart';
import 'package:travelapp/app/ui/theme/utils.dart';
import 'package:travelapp/app/ui/widgets/back_icon_page.dart';

class MapPage extends StatefulWidget {
  final GeoPoint geoPoint;
  final String description;

  const MapPage({Key key, this.geoPoint, this.description}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final attractionController = Get.put(AttractionController(AttractionRepository(AttractionApi())));
  GoogleMapController mapController;
  Set<Marker> markers = new Set<Marker>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    GeoPoint geoPoint = widget.geoPoint;
    String description = widget.description;
    LatLng position = LatLng(geoPoint.latitude, geoPoint.longitude);
    final Marker marker = Marker(
        markerId: new MarkerId("1213"),
        position: position,
        infoWindow: InfoWindow(title: description));
    setState(() {
      markers.add(marker);
    });

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackIconPage(),
        ),
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 6,
                child: GoogleMap(
                  markers: markers,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition:
                      CameraPosition(target: LatLng(geoPoint.latitude, geoPoint.longitude), zoom: 15.0),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.blue,
                  child: Column(
                    children: [
                      buildLocations(
                          Colors.deepOrangeAccent, "Museuu da Água", false),
                      buildLocations(
                          Colors.blue, "Rua das Palmeiras", false),
                      buildLocations(
                          Colors.deepPurple, "Museu da Esquina", false),
                      buildLocations(Colors.teal, "Teatro da Paz", false),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Expanded buildLocations(Color color, String text, bool fav) {
    return Expanded(
        flex: 2,
        child: Container(
          color: Util.background,
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.location_on,
                        color: color,
                        size: 30,
                      )),
                  Expanded(
                      flex: 6,
                      child: Text(
                        text,
                      )),
                  Expanded(
                      flex: 2,
                      child: Icon(
                        Icons.check_box,
                        color: color,
                      )),
                  Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )),
                ],
              )),
        ));
  }
}
