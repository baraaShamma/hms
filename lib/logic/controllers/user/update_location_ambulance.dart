import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:http/http.dart' as http;

import '../../../utils/my_string.dart';

class UpdateLocationAmbulance extends GetxController {
  CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(1, 1),
    zoom: 17.4746,
  );
  //late Position cl;
  GoogleMapController? gmc;
  Set<Marker> mymarker = {};
  late HomeContoller c ;

  var latb;
  var longb;
  late double latitude;

  late double longitude;

  late bool ff;

  Future fetch_lat_long() async {
    try {
      print("***********");
      print( c.idAmbulance);
         var data = {"idAmbulance": c.idAmbulance};
      var response = await http
          .post(Uri.parse('$baseUrl/service_user/setting/fetch_lat_long.php'), body: data);
      var responsebody = jsonDecode(response.body);
      print("-------------------");
      print(responsebody[0]["latitude"]);
      latb = responsebody[0]["latitude"];
      print(responsebody[0]["longitude"]);
      longb = responsebody[0]["longitude"];
      latitude = double.parse(latb);
      longitude = double.parse(longb);
      kGooglePlex = CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 17.4746,
      );
      update();

      return responsebody;
    } catch (e) {}
  }

  new_marker() async {
    try {
      mymarker.clear();
      mymarker.add(
        Marker(markerId: MarkerId("1"), position: LatLng(latitude, longitude)),
      );
      await gmc!
          .animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
    } catch (e) {}
  }

  late Timer timer1;
  late Timer timer2;

  bool startenable = true;
  bool stopenable = false;

  void starttimer() {
    startenable = false;
    stopenable = true;
    timer1 = Timer.periodic(
        const Duration(seconds: 5), (Timer t) => fetch_lat_long());
    timer2 = Timer.periodic(Duration(seconds: 5), (Timer t) => new_marker());
   update();
  }

  void stoptimer() {
    if (startenable == false) {
      startenable = true;
      stopenable = false;
      timer1.cancel();
      timer2.cancel();
    }
    update();
  }



  @override
  void onClose() {
    stoptimer();
    timer1.cancel();
    timer2.cancel();
    super.onClose();
  }

  @override
  void onInit() {
    c=Get.find<HomeContoller>();

    fetch_lat_long();
    starttimer();
    super.onInit();

    // getDoctors();
  }
}
