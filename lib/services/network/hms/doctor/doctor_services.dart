import 'package:hms/model/hms/doctor/appointments_doctor_hospital_model.dart';
import 'package:hms/model/hms/doctor/medical_points/medical_points_model.dart';
import 'package:hms/model/hms/doctor/setting/doctor_appointments_model.dart';
import 'package:hms/model/hms/doctor/task_doctor_model.dart';
import 'package:hms/utils/my_string.dart';
import 'package:hms/view/widgets/dialog/success_dialog.dart';
import 'package:http/http.dart' as http;

class DoctorServices {
  static Future<List<TaskDoctorModel>> getTaskDoctor(String idDoctor) async {
    var data = {"idDoctor": idDoctor};
    var response = await http.post(
        Uri.parse('$baseUrl/service_doctor/view_tasks_doctor.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return taskDoctorModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getTaskDoctor");
    }
  }

  static Future addAppointment(context, String idDoctor, String idUser,
      String date, String idTask) async {
    var data = {"idDoctor": idDoctor, "idUser": idUser, "date": date};
    var response = await http.post(
        Uri.parse('$baseUrl/service_doctor/add_appointment.php'),
        body: data);
    if (response.statusCode == 200) {
      var data2 = {"idTask": idTask};
      var response2 = await http.post(
          Uri.parse('$baseUrl/service_doctor/delete_task.php'),
          body: data2);
      if (response2.statusCode == 200) {
        DialogMessage.successDialog(context, "تم اعطاء الموعد بنجاح  ");
      }
    } else {
      return throw Exception("Failed to load addAppointment");
    }
  }

  static Future<List<DoctorAppointmentsModel>> getAppointment(
      String idDoctor) async {
    var data = {"idDoctor": idDoctor};
    var response = await http.post(
        Uri.parse('$baseUrl/service_doctor/setting/doctor_appointments.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return doctorAppointmentsModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getMedicalAnalysis");
    }
  }

  static Future<List<MedicalPointsModel>> getMedicalPoint(
      String MedicalPointName) async {
    var response = await http.get(
      Uri.parse('$baseUrl/medicalPoint/$MedicalPointName.php'),
    );
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return medicalPointsModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getMedicalAnalysis");
    }
  }

  static Future addDiagnostic(
      context, String idUser, String idDoctor, String diagnostic) async {
    if (diagnostic == "") {
      DialogMessage.errorsDialog(context, "الرجاء كتابة التشخيص");
    } else {
      var data = {
        "id_user": idUser,
        "id_doctor": idDoctor,
        "diagnosis": diagnostic
      };
      var response = await http.post(
          Uri.parse('$baseUrl/service_doctor/addDiagnostic.php'),
          body: data);
      if (response.statusCode == 200) {
        var jsonData = response.body;
        DialogMessage.successDialog(context, "تم اضافة التشخيص بنجاح");
      } else {
        return throw Exception("Failed to load addInquiries");
      }
    }
  }

  static Future addTaskMedicalPoint(context, int order, String idUser,
      String idDoctor, idMedicalPoint, String text) async {
    if (text == "") {
      DialogMessage.errorsDialog(context, "الرجاء كتابة المعلومات اللازمة");
    } else {
      if (order == 1) {
        var data = {
          "id_user": idUser,
          "id_doctor": idDoctor,
          "id_medical_laboratory": idMedicalPoint,
          "text": text
        };
        var response = await http.post(
            Uri.parse(
                '$baseUrl/service_doctor/add_task_medical_laboratory.php'),
            body: data);
        if (response.statusCode == 200) {
          var jsonData = response.body;
          DialogMessage.successDialog(context, "تم اضافة الطلب بنجاح");
        } else {
          return throw Exception("Failed to load addTaskMedicalPoint");
        }
      } else if (order == 2) {
        var data = {
          "id_user": idUser,
          "id_doctor": idDoctor,
          "id_radiology_center": idMedicalPoint,
          "text": text
        };
        var response = await http.post(
            Uri.parse('$baseUrl/service_doctor/add_task_radiology_center.php'),
            body: data);
        if (response.statusCode == 200) {
          var jsonData = response.body;
          DialogMessage.successDialog(context, "تم اضافة الطلب بنجاح");
        } else {
          return throw Exception("Failed to load addTaskMedicalPoint");
        }
      } else if (order == 3) {
        print(idMedicalPoint);

        var data = {
          "id_user": idUser,
          "id_doctor": idDoctor,
          "id_hospital": idMedicalPoint,
          "text": text
        };
        var response = await http.post(
            Uri.parse('$baseUrl/service_doctor/add_task_hospital.php'),
            body: data);
        if (response.statusCode == 200) {
          var jsonData = response.body;
          DialogMessage.successDialog(context, "تم اضافة الطلب بنجاح");
        } else {
          return throw Exception("Failed to load addTaskMedicalPoint");
        }
      } else {
        var data = {
          "id_user": idUser,
          "id_doctor": idDoctor,
          "id_pharmacy": idMedicalPoint,
          "text": text
        };
        var response = await http.post(
            Uri.parse('$baseUrl/service_doctor/add_task_pharmacy.php'),
            body: data);
        if (response.statusCode == 200) {
          var jsonData = response.body;
          DialogMessage.successDialog(context, "تم اضافة الطلب بنجاح");
        } else {
          return throw Exception("Failed to load addTaskMedicalPoint");
        }
      }
    }
  }

  static Future deleteAppointment(String idTask) async {
    var data = {"idTask": idTask};
    var response = await http.post(
        Uri.parse('$baseUrl/service_doctor/delet_appointment.php'),
        body: data);
    if (response.statusCode == 200) {
    } else {
      return throw Exception("Failed to load deleteAppointment");
    }
  }

  static Future deleteComment(String idComment) async {
    var data = {"idComment": idComment};
    var response = await http.post(
        Uri.parse('$baseUrl/service_doctor/delete_comment.php'),
        body: data);
    if (response.statusCode == 200) {
    } else {
      return throw Exception("Failed to load deleteAppointment");
    }
  }

  static Future deleteAppointmentsDoctorHospital(String idTask) async {
    var data = {"idTask": idTask};
    var response = await http.post(
        Uri.parse(
            '$baseUrl/service_doctor/deleteAppointmentsDoctorHospital.php'),
        body: data);
    if (response.statusCode == 200) {
    } else {
      return throw Exception("Failed to load deleteAppointment");
    }
  }

  static Future<List<AppointmentsDoctorHospitalModel>>
      getAppointmentsDoctorHospital(String idDoctor) async {
    var data = {"idDoctor": idDoctor};
    var response = await http.post(
        Uri.parse('$baseUrl/service_doctor/appointments_hospital_doctor.php'),
        body: data);
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return appointmentsDoctorHospitalModelFromJson(jsonData);
    } else {
      return throw Exception("Failed to load getAppointmentsDoctorHospital");
    }
  }
}
