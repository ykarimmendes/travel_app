import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:travelapp/app/data/controller/attraction_controller.dart';
import 'package:travelapp/app/data/controller/favourite_controller.dart';
import 'package:travelapp/app/data/controller/map_controller.dart';
import 'package:travelapp/app/data/provider/attraction_api.dart';
import 'package:travelapp/app/data/provider/favourite_api.dart';
import 'package:travelapp/app/data/repository/attraction_repository.dart';
import 'package:travelapp/app/data/repository/favourite_repository.dart';
import 'package:travelapp/app/ui/theme/utils.dart';
import 'package:travelapp/app/ui/widgets/back_icon_page.dart';

class MapPage extends StatefulWidget {
  final GeoPoint geoPoint;
  final String description;

  MapPage({Key key, this.geoPoint, this.description}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final attractionController =
      Get.put(AttractionController(AttractionRepository(AttractionApi())));

  final favouriteController =
      Get.put(FavouriteController(FavouriteRepository(FavouriteApi())));

  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: BackIconPage(),
        ),
        body: GetX<MapController>(
            init: MapController(),
            initState: (state) {
              Get.find<MapController>()
                  .getMapApp(attractionController.attractionsList);
            },
            builder: (_) {
              return Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: GoogleMap(
                        markers: _.createMarker(_.mapAppList),
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                            target:
                                LatLng(widget.geoPoint.latitude, widget.geoPoint.longitude),
                            zoom: 12),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                          color: Util.background,
                          child: ListView.builder(
                              itemCount: _.mapAppList.length,
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return buildLocations(
                                    _,
                                    index,
                                    favouriteController.getIsFavourite2(
                                        _.mapAppList[index].reference.id));
                              })),
                    ),
                  ],
                ),
              );
            }));
  }

  Padding buildLocations(MapController _, int index, bool fav) {
    _.mapAppList[index].isMapClicked = fav;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
                flex: 10,
                child:
                Obx(() => Icon(
                  Icons.location_on,
                  color: _.mapAppList[index].isMapClicked ? Util.colors[index] : Colors.grey,
                  size: 30,
                )),

                ),
            Expanded(
                flex: 60,
                child: Text(
                  _.mapAppList[index].title,
                )),
            Expanded(
                flex: 20,
                child: Obx(() => IconButton(
                      icon: Icon(_.mapAppList[index].isMapClicked
                          ? Icons.check_box
                          : Icons.check_box_outline_blank_sharp),
                      color: _.mapAppList[index].isMapClicked ?Util.colors[index] : Colors.grey,
                      onPressed: () {

                        _.click(index);

                        if (_.mapAppList[index].isMapClicked == false){
                          _.markers.removeWhere((element) => element.markerId == _.mapAppList[index].title);
                        }
                        //_handleTap(index);
                      },
                    ))),
            Expanded(
                flex: 10,
                child: Icon(
                  Icons.favorite,
                  color: fav ? Colors.red : Colors.grey,
                )),
          ],
        ));
  }

  void _handleTap(index) {
    /*
    setState(() {
      _ies[index].check = !_ies[index].check;
      _totalSelected = _ies.where((element) => element.check).length;

      if (_ies[index].check) {
        _totalDistance += _ies[index].distance;
      } else
        _totalDistance -= _ies[index].distance;
    });
     */
  }
}
