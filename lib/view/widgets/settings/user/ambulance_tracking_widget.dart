import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hms/logic/controllers/user/update_location_ambulance.dart';
class AmbulanceTrackingWidget extends StatelessWidget {
  AmbulanceTrackingWidget({Key? key}) : super(key: key);
  final controller = Get.put(UpdateLocationAmbulance());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdateLocationAmbulance>(

        builder: (_)=> Container(
          height: MediaQuery.of(context).size.height-50,
          width: 400,
          child: GoogleMap(
            markers: controller.mymarker,
            mapType: MapType.hybrid,
            initialCameraPosition: controller.kGooglePlex,
            onMapCreated: (GoogleMapController controlller) {
              controller.gmc = controlller;
            },
          ),
        ));
  }
}
