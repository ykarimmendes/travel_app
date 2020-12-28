import 'package:get/get.dart';
import 'package:travelapp/app/bindings/attraction_biding.dart';
import 'package:travelapp/app/ui/atracctions/attraction_page.dart';
import 'package:travelapp/app/ui/home/home_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: Routes.INITIAL, page:()=> HomePage(),),
    GetPage(name: Routes.ATTRACTION, page:()=> AttractionPage(), binding: AttractionBiding()),
    //GetPage(name: Routes.RESTAURANT, page:()=> DetailsPage(), binding: DetailsBinding()),
    //GetPage(name: Routes.EVENT, page:()=> DetailsPage(), binding: DetailsBinding()),
  ];
}