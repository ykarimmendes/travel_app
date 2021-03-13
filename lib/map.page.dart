import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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

  PolylinePoints polylinePoints;
  List<LatLng> polylineCoordinates = [];
  Map<PolylineId, Polyline> polylines = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
     GeoPoint initialGeoPoint = widget.geoPoint;
     int x = 0;
    for (var att in attractionController.attractionsList) {
      GeoPoint geoPoint = att.geoPoint;
      String description = att.title;
      LatLng position = LatLng(geoPoint.latitude, geoPoint.longitude);
      final Marker marker = Marker(
          markerId: new MarkerId(att.reference.id),
          position: position,
          icon: BitmapDescriptor.defaultMarkerWithHue(Util.marker[x]),
          infoWindow: InfoWindow(title: description));
      //setState(() {
      x++;
      markers.add(marker);
      //});

    }

    //TODO essa porra é paga
     //(attractionController.attractionsList[0].geoPoint,attractionController.attractionsList[1].geoPoint);

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
                  polylines: Set<Polyline>.of(polylines.values),
                  markers: markers,
                  onMapCreated: _onMapCreated,
                  initialCameraPosition:
                      CameraPosition(target: LatLng(initialGeoPoint.latitude, initialGeoPoint.longitude), zoom: 12),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Util.background,
                  child: ListView.builder(
                    itemCount: attractionController.attractionsList.length,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return buildLocations(Util.colors[index], attractionController.attractionsList[index].title, true);
                    }
                  )
                ),
              ),
            ],
          ),
        ));
  }

  Padding buildLocations(Color color, String text, bool fav) {
    return
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                    flex: 10,
                    child: Icon(
                      Icons.location_on,
                      color: color,
                      size: 30,
                    )),
                Expanded(
                    flex: 60,
                    child: Text(
                      text,
                    )),
                Expanded(
                    flex: 20,
                    child: Icon(
                      Icons.check_box,
                      color: color,
                    )),
                Expanded(
                    flex: 10,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )),
              ],
            ));
  }

  // Create the polylines for showing the route between two places

  _createPolylines(GeoPoint start, GeoPoint destination) async {
    // Initializing PolylinePoints
    polylinePoints = PolylinePoints();

    // Generating the list of coordinates to be used for
    // drawing the polylines
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Util.googleApi, // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.transit,
    );

    // Adding the coordinates to the list
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;
  }
}
