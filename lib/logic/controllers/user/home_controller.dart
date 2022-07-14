import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/model/hms/doctore_model.dart';
import 'package:hms/model/hms/home/advertising_model.dart';
import 'package:hms/model/hms/home/articles_model.dart';
import 'package:hms/model/hms/home/categories_model.dart';
import 'package:hms/model/hms/user/medical_inquiries/comment_model.dart';
import 'package:hms/model/hms/user/medical_inquiries/inquiries_model.dart';
import 'package:hms/model/hms/user/pathological_record/medical_analysis_model.dart';
import 'package:hms/model/hms/user/pathological_record/medical_diagnostics_model.dart';
import 'package:hms/model/hms/user/pathological_record/pharmacy_user_model.dart';
import 'package:hms/model/hms/user/pathological_record/xray_pictures_model.dart';
import 'package:hms/model/hms/user/setting/ambulance_user_model.dart';
import 'package:hms/model/hms/user/setting/appointments_user_hospital_model.dart';
import 'package:hms/model/hms/user/setting/appointments_user_model.dart';
import 'package:hms/model/hms/user/setting/view_order_model.dart';
import 'package:hms/services/network/hms/hms_services.dart';
import 'package:hms/services/network/hms/user/user_services.dart';
import 'package:hms/view/widgets/auth/text_from_field.dart';
import 'package:hms/view/widgets/dialog/success_dialog.dart';
import 'package:hms/utils/notification.dart';
import 'package:hms/view/widgets/settings/user_doctor/edit.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomeContoller extends GetxController {
  final GetStorage storage = GetStorage();
  late Timer timeer;
  int start = 0;
  var inquiriesList = <InquiriesModel>[].obs;
  var isLoadingInquiries = true.obs;
  var isLoadingHospitalAmbulance = true.obs;
  var isLoading = true.obs;
  var isLoadingAdvertising = true.obs;
  var isLoadingArticles = true.obs;
  var isLoadingComment = true.obs;
  var isLoadingUserAppointments = true.obs;
  var categoriesList = <CategoriesModel>[].obs;
  var advertisingList = <AdvertisingModel>[].obs;
  var articlesList = <ArticlesModel>[].obs;
  var doctorsList = <DoctoreModel>[].obs;
  var commentsList = <CommentModel>[];
  var medicalDiagnosticsList = <MedicalDiagnosticsModel>[].obs;
  var medicalAnalysisList = <MedicalAnalysisModel>[].obs;
  var xrayPicturesList = <XrayPicturesModel>[].obs;
  var pharmacyUserList = <PharmacyUserModel>[].obs;
  var isLoadingDoctores = true.obs;
  var isLoadingDiagnostics = true.obs;
  var isLoadingMedicalAnalysis = true.obs;
  var isLoadingXrayPictures = true.obs;
  var isLoadingPharmacyUser = true.obs;
  var userAppointmentsList = <AppointmentsUserModel>[].obs;
  var ambulanceUserList = <AmbulanceUserModel>[].obs;
  var userAppointmentsHospitalList = <AppointmentsUserHospitalModel>[];
  var isLoadingUserAppointmentsHospital = true;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  Stream<RemoteMessage> baraa = FirebaseMessaging.onMessageOpenedApp;
  late String token;
  var idUser;
  var nameUser;

  void deleteMedicalInquiries(idPost) async {
    await UserServices.deleteMedicalInquiries(idPost);
    inquiriesList.removeWhere((element) => element.postId == idPost);
  }

  void appointmentBooking(context, id_user, id_doctor, token) async {
    await UserServices.appointmentBooking(
        context, id_user, id_doctor, token, nameUser);
  }

  final TextEditingController addcomment = TextEditingController();

  Future addInquiries(context, post, postUser) async {
    await UserServices.addInquiries(context, post, postUser);
    update();
  }

  Future addComment(context, comment, idUser, idPost) async {
    await UserServices.addComment(context, comment, idUser, idPost);
    getComments(idPost);
    // update();
  }

  Future getInquiries() async {
    var inquirie = await UserServices.getInquiries();
    update();
    inquiriesList.clear();

    try {
      isLoadingInquiries(true);
      if (inquirie.isNotEmpty) {
        inquiriesList.addAll(inquirie);
      }
    } finally {
      isLoadingInquiries(false);
    }
  }

  Future getComments(postId) async {
    var comments = await UserServices.getComment(postId);
    commentsList.clear();

    update();

    try {
      isLoadingComment(true);
      if (comments.isNotEmpty) {
        commentsList.addAll(comments);
      }
    } finally {
      isLoadingComment(false);
    }
  }

  void getDoctors(id_categorie) async {
    var doctores = await HmsServices.getDoctores(id_categorie);

    doctorsList.clear();

    try {
      isLoadingDoctores(true);
      if (doctores.isNotEmpty) {
        doctorsList.addAll(doctores);
      }
    } finally {
      isLoadingDoctores(false);
    }
  }

  void getCategorie() async {
    var categories = await HmsServices.getCategories();

    try {
      isLoading(true);
      if (categories.isNotEmpty) {
        categoriesList.addAll(categories);
      }
    } finally {
      isLoading(false);
    }
  }

  void getArticles() async {
    var articles = await HmsServices.getArticles();

    try {
      isLoadingArticles(true);
      if (articles.isNotEmpty) {
        articlesList.addAll(articles);
      }
    } finally {
      isLoadingArticles(false);
    }
  }

  void getAdvertising() async {
    var advertising = await HmsServices.getAdvertising();

    try {
      isLoadingAdvertising(true);
      if (advertising.isNotEmpty) {
        advertisingList.addAll(advertising);
      }
    } finally {
      isLoadingAdvertising(false);
    }
  }

  Future getMedicalDiagnostics(idUser) async {
    var Diagnostics = await UserServices.getMedicalDiagnostics(idUser);

    medicalDiagnosticsList.clear();

    try {
      isLoadingDiagnostics(true);
      if (Diagnostics.isNotEmpty) {
        medicalDiagnosticsList.addAll(Diagnostics);
      }
    } finally {
      isLoadingDiagnostics(false);
    }
  }

  Future getMedicalAnalysis(idUser) async {
    medicalAnalysisList.clear();

    var medicalAnalysis = await UserServices.getMedicalAnalysis(idUser);

    try {
      isLoadingMedicalAnalysis(true);
      if (medicalAnalysis.isNotEmpty) {
        medicalAnalysisList.addAll(medicalAnalysis);
      }
    } finally {
      isLoadingMedicalAnalysis(false);
    }
  }

  Future getXrayPictures(idUser) async {
    xrayPicturesList.clear();

    var XrayPictures = await UserServices.getXrayPictures(idUser);

    try {
      isLoadingXrayPictures(true);
      if (XrayPictures.isNotEmpty) {
        xrayPicturesList.addAll(XrayPictures);
      }
    } finally {
      isLoadingXrayPictures(false);
    }
  }

  Future getPharmacyUser(idUser) async {
    pharmacyUserList.clear();

    var PharmacyUser = await UserServices.getPharmacyUser(idUser);

    try {
      isLoadingPharmacyUser(true);
      if (PharmacyUser.isNotEmpty) {
        pharmacyUserList.addAll(PharmacyUser);
      }
    } finally {
      isLoadingPharmacyUser(false);
    }
  }

  Future getAppointment() async {
    var userAppointments = await UserServices.getAppointment(idUser);
    update();

    userAppointmentsList.clear();

    try {
      isLoadingUserAppointments(true);
      if (userAppointments.isNotEmpty) {
        userAppointmentsList.addAll(userAppointments);
      }
    } finally {
      isLoadingUserAppointments(false);
    }
  }

  void getAppointmentsUserHospital() async {
    var appointmentsDoctorHospital =
        await UserServices.getAppointmentsUserHospital(idUser);
    update();

    userAppointmentsHospitalList.clear();

    try {
      isLoadingUserAppointmentsHospital = true;
      if (appointmentsDoctorHospital.isNotEmpty) {
        userAppointmentsHospitalList.addAll(appointmentsDoctorHospital);
      }
    } finally {
      isLoadingUserAppointmentsHospital = false;
    }
  }

  late bool services;
  late LocationPermission per;
  late String nameHospital;

  Future getPirmission() async {
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {}
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per == await Geolocator.requestPermission();
    }
  }

  Map<String, dynamic> distance = {};
  var idHospital;
  var latitude;
  var longitude;

  // // bool AmbulanceUser=true;
  // GetStorage g = GetStorage('MyStorage');
  //
  // TimerAmbulance() async {
  //   timeer = Timer.periodic(
  //     const Duration(seconds: 1),
  //     (Timer timer) {
  //       if (start == 60) {
  //         timer.cancel();
  //         //AmbulanceUser=true;
  //         print(baraaa);
  //         start = 0;
  //         baraaa = false.obs;
  //         g.remove("key");
  //         g.write("key", 0);
  //
  //         update();
  //       } else {
  //         start += 5;
  //         g.write("key", start);
  //         //     print(g.read("key"));
  //         //AmbulanceUser=false;
  //         update();
  //       }
  //     },
  //   );
  // }

  Future getHospitalAmbulance(context) async {
    DialogMessage.showDialogLoading(context);
    ambulanceUserList.clear();
    var hospitalAmbulance = await UserServices.getHospitalAmbulance();

    try {
      isLoadingHospitalAmbulance(true);
      if (hospitalAmbulance.isNotEmpty) {
        ambulanceUserList.addAll(hospitalAmbulance);
        update();
      }
    } finally {
      if (ambulanceUserList.isNotEmpty) {
        var latlong =
            await Geolocator.getCurrentPosition().then((value) => value);
        latitude = latlong.latitude;
        longitude = latlong.longitude;
        for (int i = 0; i < ambulanceUserList.length; i++) {
          calculateDistance(
              ambulanceUserList[i].id_user,
              latitude,
              longitude,
              double.parse(ambulanceUserList[i].latitude),
              double.parse(ambulanceUserList[i].longitude));
        }
        var minDistance = distance.values.first;
        idHospital = distance.keys.first;
        distance.forEach((key, value) {
          if (value < minDistance) {
            minDistance = value;
            idHospital = key;
          }
        });
        for (int i = 0; i < ambulanceUserList.length; i++) {
          if (ambulanceUserList[i].id_user == idHospital) {
            nameHospital = ambulanceUserList[i].username;
          }
        }

        await UserServices.requestAmbulance(
            idHospital, idUser, latitude.toString(), longitude.toString());
        Get.back();
        distance.clear();

        DialogMessage.successDialog(
            context, "تم طلب سييارة الاسعاف من  \n $nameHospital ");
        isLoadingHospitalAmbulance(false);
        baraaa = true.obs;
        update();
        // await TimerAmbulance();
      } else {
        Get.back();
        DialogMessage.warningDialog(
            context, "نعتذر لا توجد سيارة اسعاف متاحة حاليا");
      }
    }
  }

  calculateDistance(id, latUser, longUser, latHospital, longHospital) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((latHospital - latUser) * p) / 2 +
        cos(latUser * p) *
            cos(latHospital * p) *
            (1 - cos((longHospital - longUser) * p)) /
            2;
    double x = 12742 * asin(sqrt(a));
    distance.addEntries([
      MapEntry(id.toString(), x),
    ]);
    update();
  }

  RxBool baraaa = false.obs;
  var idAmbulance;

  void userAmbulance() async {
    var userAmbulancee = await UserServices.userAmbulance(idUser);
    // update();

    try {
      if (userAmbulancee["status"] == "success") {
        baraaa = true.obs;
        idAmbulance = userAmbulancee["id_ambulance"];
        update();
      } else {
        baraaa = false.obs;
      }
      update();
    } finally {
      update();
    }
    update();
  }

  var viewOrderUserList = <ViewOrderModel>[].obs;
  var isViewOrderUserLoading = false.obs;
  GlobalKey<FormState> formStatesInformation = GlobalKey<FormState>();
  TextEditingController information = TextEditingController();

  Future viewOrderUser() async {
    var ordersUser = await UserServices.viewOrderUser(idUser);
    print(ordersUser);
    viewOrderUserList.clear();
    try {
      isViewOrderUserLoading(true);
      if (ordersUser.isNotEmpty) {
        viewOrderUserList.addAll(ordersUser);
      }
    } finally {
      isViewOrderUserLoading(false);
    }
  }

  void editAddressUser(context) {

    UserServices.editAddressUser(idUser, information.text);
    DialogMessage.successDialog(
        context, "تم تعديل العنوان بنجاح");
    information.clear();
  }

  void editPasswordUser(context) {
    UserServices.editPasswordUser(idUser, information.text);
    DialogMessage.successDialog(
        context, "تم تعديل كلمة المرور بنجاح");
    information.clear();
  }

  void editPhoneUser(context) {
    UserServices.editPhoneUser(idUser, information.text);
    DialogMessage.successDialog(
        context, "تم تعديل الرقم بنجاح");
    information.clear();
  }

  @override
  void onInit() {
    idUser = storage.read("idUser");
    nameUser = storage.read("nameUser");
    NotificationBaraa.requestPermission();
    NotificationBaraa.loadFCM();
    NotificationBaraa.listenFCM();
    messaging.getToken();
    userAmbulance();

    super.onInit();
    getPirmission();
    getAdvertising();
    getArticles();
    getCategorie();
    getInquiries();
    // getDoctors();
  }
}
