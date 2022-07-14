import 'dart:convert';
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

import 'package:hms/utils/my_string.dart';
import 'package:hms/utils/notification.dart';
import 'package:hms/view/widgets/dialog/success_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class UserServices {

  static Future deleteMedicalInquiries(String idPost) async {
    var data = {"idPost": idPost};
    var response = await http.post(
        Uri.parse('$baseUrl/service_user/delete_post.php'),
        body: data);
    if (response.statusCode == 200) {
    } else {
      return throw Exception("Failed to load deleteAppointment");
    }
  }

  static Future appointmentBooking(
      context, String id_user, String id_doctor ,String token,String nameUser) async {
    NotificationBaraa.sendPushMessage(token, "اسم المريض : $nameUser", "موعد جديد");

    var data = {"id_user": id_user.toString(), "id_doctor": id_doctor};
    var response = await http
        .post(Uri.parse('$baseUrl/service_user/addtaskdoctor.php'), body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      DialogMessage.successDialog(context,
          " تم حجز الموعد بنجاح \nالرجاء الانتظار لحين تحديد الموعد من قبل الطبيب");
    } else {
      return throw Exception("Failed to load categories");
    }
  }

  static Future addInquiries(context, String post, String postUser) async {
    if (post == "") {
      DialogMessage.errorsDialog(context, "الرجاء كتابة الاستفسار");
    } else {
      var data = {"post": post.toString(), "postUser": postUser};
      var response = await http
          .post(Uri.parse('$baseUrl/service_user/addPost.php'), body: data);
      if (response.statusCode == 200) {
        var jsonData = response.body;
        DialogMessage.successDialog(context, "تم اضافة الاستفسار بنجاح");
      } else {
        return throw Exception("Failed to load addInquiries");
      }
    }
  }

  static Future addComment(
      context, String comment, String idUser, String idPost) async {
    if (comment == "") {
      DialogMessage.errorsDialog(context, "الرجاء كتابة التعليق");
    } else {
      var data = {
        "comment": comment,
        "comment_user": idUser,
        "comment_post": idPost
      };
      var response = await http
          .post(Uri.parse('$baseUrl/service_user/addComment.php'), body: data);
      if (response.statusCode == 200) {
        var jsonData = response.body;
      } else {
        return throw Exception("Failed to load addComment");
      }
    }
  }

  static Future<List<InquiriesModel>> getInquiries() async {
    var response = await http.get(Uri.parse('$baseUrl/service_user/post.php'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return inquiriesModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load post");
    }
  }

  static Future<List<AmbulanceUserModel>> getHospitalAmbulance() async {
    var response = await http
        .get(Uri.parse('$baseUrl/service_user/setting/hospital_user.php'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return ambulanceUserModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getHospitalAmbulance");
    }
  }

  static Future<List<CommentModel>> getComment(String postid) async {
    var data = {"postId": postid};
    var response = await http
        .post(Uri.parse('$baseUrl/service_user/comments.php'), body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return commentModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getComment");
    }
  }

  static Future<List<MedicalDiagnosticsModel>> getMedicalDiagnostics(
      String idUser) async {
    var data = {"idUser": idUser};
    var response = await http.post(
        Uri.parse(
            '$baseUrl/service_user/PathologicalRecord/medical_diagnostics.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return medicalDiagnosticsModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getMedicalDiagnostics");
    }
  }

  static Future<List<MedicalAnalysisModel>> getMedicalAnalysis(
      String idUser) async {
    var data = {"idUser": idUser};
    var response = await http.post(
        Uri.parse(
            '$baseUrl/service_user/PathologicalRecord/getMedicalAnalysis.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return medicalAnalysisModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getMedicalAnalysis");
    }
  }

  static Future<List<XrayPicturesModel>> getXrayPictures(String idUser) async {
    var data = {"idUser": idUser};
    var response = await http.post(
        Uri.parse(
            '$baseUrl/service_user/PathologicalRecord/getXrayPictures.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return xrayPicturesModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getMedicalAnalysis");
    }
  }

  static Future<List<PharmacyUserModel>> getPharmacyUser(String idUser) async {
    var data = {"idUser": idUser};
    var response = await http.post(
        Uri.parse('$baseUrl/service_user/PathologicalRecord/get_pharmacy.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return pharmacyUserModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getMedicalAnalysis");
    }
  }

  static Future<List<AppointmentsUserModel>> getAppointment(
      String idUser) async {
    var data = {"idUser": idUser};
    var response = await http.post(
        Uri.parse('$baseUrl/service_user/setting/user_appointments.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return appointmentsUserModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getMedicalAnalysis");
    }
  }

  static Future requestAmbulance(String idHospitals, String idUser,
      String latitudeUser, String longitudeUser) async {
    var data = {
      "idHospitals": idHospitals,
      "idUser": idUser,
      "latitudeUser": latitudeUser,
      "longitudeUser": longitudeUser
    };
    var response = await http.post(
        Uri.parse('$baseUrl/service_user/setting/request_ambulance.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      print(jsonData);
    } else {
      return throw Exception("Failed to requestAmbulance");
    }
  }
  static Future userAmbulance(String idUser) async {
    var data = {
      "idUser": idUser,

    };
    var response = await http.post(
        Uri.parse('$baseUrl/service_user/setting/userAmbulance.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      return jsonData;
    } else {
      return throw Exception("Failed to requestAmbulance");
    }
  }

  static Future<List<AppointmentsUserHospitalModel>>
      getAppointmentsUserHospital(String idUser) async {
    var data = {"idUser": idUser};
    var response = await http.post(
        Uri.parse(
            '$baseUrl/service_user/setting/appointments_hospital_user.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return appointmentsUserHospitalModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getAppointmentsDoctorHospital");
    }
  }


  static Future<List<ViewOrderModel>> viewOrderUser(idUser) async {
    var data = {"idUser": idUser};
    var response = await http.post(
        Uri.parse('$baseUrl/store/admin_store/order/view_user_product.php'),
        body: data);

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return viewOrderModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
  }


  static Future editAddressUser(String idUser, String address) async {
    var data = {"id_user": idUser, "address": address};
    var response = await http.post(
        Uri.parse('$baseUrl/service_user/setting/edit_address.php'),
        body: data);

    if (response.statusCode == 200) {
      var jsonData = response.body;
    } else {
      return throw Exception("Failed to load categories");
    }
  }
  static Future editPasswordUser(String idUser, String password) async {
    var data = {"id_user": idUser, "password": password};
    var response = await http.post(
        Uri.parse('$baseUrl/service_user/setting/edit_password.php'),
        body: data);

    if (response.statusCode == 200) {
      var jsonData = response.body;
    } else {
      return throw Exception("Failed to load edit_password");
    }
  }
  static Future editPhoneUser(String idUser, String phone) async {
    var data = {"id_user": idUser, "phone": phone};
    var response = await http.post(
        Uri.parse('$baseUrl/service_user/setting/edit_phone.php'),
        body: data);

    if (response.statusCode == 200) {
      var jsonData = response.body;
    } else {
      return throw Exception("Failed to load categories");
    }
  }


}
