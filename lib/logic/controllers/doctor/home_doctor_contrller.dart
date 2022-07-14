import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hms/logic/controllers/user/home_controller.dart';
import 'package:hms/model/hms/doctor/appointments_doctor_hospital_model.dart';
import 'package:hms/model/hms/doctor/medical_points/medical_points_model.dart';
import 'package:hms/model/hms/doctor/setting/doctor_appointments_model.dart';
import 'package:hms/model/hms/doctor/task_doctor_model.dart';

import 'package:hms/services/network/hms/doctor/doctor_services.dart';
import 'package:intl/intl.dart';

class HomeDoctorController extends GetxController {
  final GetStorage getStorage = GetStorage();
  Timer? timer1;
  var taskDoctorList = <TaskDoctorModel>[].obs;
  var doctorAppointmentsList = <DoctorAppointmentsModel>[].obs;
  var doctorAppointmentsHospitalList = <AppointmentsDoctorHospitalModel>[].obs;
  var medicalPointList = <MedicalPointsModel>[].obs;
  late String date;
  late String idDoctor;
  var isLoadingTaskDoctor = true.obs;
  var isLoadingMedicalPoint = true.obs;
  var isLoadingDoctorAppointments = true.obs;
  var isLoadingDoctorAppointmentsHospital = true.obs;
  DateTime? datePicked;
  TimeOfDay? timePicked;
  TextEditingController addDiagnosticUser = new TextEditingController();
  TextEditingController addTaskMedicalPointUser = new TextEditingController();

  Future getTaskDoctor() async {
    var taskDoctor = await DoctorServices.getTaskDoctor(idDoctor);
    update();
    taskDoctorList.clear();

    try {
      isLoadingTaskDoctor(true);
      if (taskDoctor.isNotEmpty) {
        taskDoctorList.addAll(taskDoctor);
        //  print(taskDoctorList[0].username);
      }
    } finally {
      isLoadingTaskDoctor(false);
    }
    update();
  }

  Future getAppointment() async {
    var doctorAppointments = await DoctorServices.getAppointment(idDoctor);
    update();

    doctorAppointmentsList.clear();

    try {
      isLoadingDoctorAppointments(true);
      if (doctorAppointments.isNotEmpty) {
        doctorAppointmentsList.addAll(doctorAppointments);
      }
    } finally {
      isLoadingDoctorAppointments(false);
    }
  }

  Future getAppointmentsDoctorHospital() async {
    var appointmentsDoctorHospital =
        await DoctorServices.getAppointmentsDoctorHospital(idDoctor);
    update();

    doctorAppointmentsHospitalList.clear();

    try {
      isLoadingDoctorAppointmentsHospital(true);
      if (appointmentsDoctorHospital.isNotEmpty) {
        doctorAppointmentsHospitalList.addAll(appointmentsDoctorHospital);
      }
    } finally {
      isLoadingDoctorAppointmentsHospital(false);
    }
  }

  Future getMedicalPoint(String medicalPointName) async {
    medicalPointList.clear();
    var medicalPoint = await DoctorServices.getMedicalPoint(medicalPointName);
    try {
      isLoadingMedicalPoint(true);
      if (medicalPoint.isNotEmpty) {
        medicalPointList.addAll(medicalPoint);
        print(medicalPointList[0].image);
      }
    } finally {
      isLoadingMedicalPoint(false);
    }
    update();
  }

  Future addAppointment(context, idDoctor, idUser, date, idTask) async {
    await DoctorServices.addAppointment(
        context, idDoctor, idUser, date, idTask);
  }

  Future addDiagnostic(context, idUser, diagnostic) async {
    await DoctorServices.addDiagnostic(context, idUser, idDoctor, diagnostic);
    addDiagnosticUser.clear();
  }

  Future deleteAppointment(idTask) async {
    await DoctorServices.deleteAppointment(idTask);
    doctorAppointmentsList.removeWhere((element) => element.idTask == idTask);
  }
  Future deleteAppointmentsDoctorHospital(idTask) async {
    await DoctorServices.deleteAppointmentsDoctorHospital(idTask);
    doctorAppointmentsHospitalList.removeWhere((element) => element.idTask == idTask);
  }

  Future addTaskMedicalPoint(
      context, order, idUser, idMedicalPoint, text) async {
    await DoctorServices.addTaskMedicalPoint(
        context, order, idUser, idDoctor, idMedicalPoint, text);
    addTaskMedicalPointUser.clear();
  }

  Future<void> showDateTimePicker(context, idUser, idTask) async {
    datePicked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (datePicked != null) {
      timePicked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay(
              hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute));
      if (timePicked != null) {
        date = DateFormat("yyyy-MM-dd").format(datePicked!) +
            " " +
            timePicked!.format(context);
        await addAppointment(context, idDoctor, idUser, date, idTask);
        taskDoctorList.removeWhere((element) => element.idTask == idTask);
      }
    }
  }
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  void deleteComment(idComment)async{
    await DoctorServices.deleteComment(idComment);
  }
  @override
  void onInit() {
    idDoctor = GetStorage().read("idUser");
    messaging.getToken();

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(message.notification!.title);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("notification: resume");
    });


    super.onInit();
    getTaskDoctor();
  }
}
