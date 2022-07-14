import 'package:hms/model/auth/login_model.dart';
import 'package:hms/services/network/hms/auth/authentication.dart';

import '../../model/auth/facebook_model.dart';
import 'package:hms/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
class AuthController extends GetxController {
  bool isVisibilty = false;
  bool isCheackBox = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var google = GoogleSignIn();
  var userName = "";
  var displayUserPhoto;
  FaceBookModel? faceBookModel;
  var informationList = <LoginModel>[].obs;

  var isSignIn = false;

  final GetStorage authBox = GetStorage();

  void visibilty() {
    isVisibilty = !isVisibilty;
    update();
  }

  void cheackBox() {
    isCheackBox = !isCheackBox;
    update();
  }

  void signUPUsingFirebase({
    required String name,
    required String email,
    required String password,
    required String phone,
    required String address,
  }) async {
    try {
      /*  await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
      });*/

      await Authentication.signUp(name, email, password, phone, address);
      Get.offNamed(Routes.loginScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = "";
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.message.toString();
      }

      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.black,
      );
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.black,
      );
    }
  }
  FirebaseMessaging messaging = FirebaseMessaging.instance;
   var token;
  void loginUsingFirebase(
      {required String email, required String password}) async {
    authBox.write("isLoginUser", false);
    authBox.write("isLoginDoctor", false);
    await messaging.getToken().then((value) {
      token=value;
      update();

    });
    try {
      /*  await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        userName = auth.currentUser!.displayName!;

        authBox.write("auth", isSignIn);
        update();
        Get.offNamed(Routes.mainScreen);
      });*/
      var information = await Authentication.login(email, password,token);
      informationList.add(information);
      isSignIn = true;
      authBox.write("auth", isSignIn);
      authBox.write("idUser", informationList[0].idUser);
      authBox.write("username", informationList[0].username);
      if(informationList[0].typeUser=="user")
        {

          authBox.write("nameUser", informationList[0].username);

          authBox.write("isLoginUser", true);
        }
      else if(informationList[0].typeUser=="doctor")
        {

          authBox.write("isLoginDoctor", true);

        }

      Get.offNamed(Routes.mainScreen);
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = "";
      if (e.code == 'user-not-found') {
        message = "Invalid email, Pleas try again";
      } else if (e.code == 'wrong-password') {
        message = "Invalid Password, Pleas try again";
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.black,
      );
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.black,
      );
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      update();
      Get.back();
    } on FirebaseAuthException catch (e) {
      String title = e.code.replaceAll(RegExp("-"), " ").capitalize!;
      String message = "";
      if (e.code == 'user-not-found') {
        message = "Invalid email, Pleas try again";
      } else {
        message = e.message.toString();
      }
      Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.black,
      );
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.black,
      );
    }
  }

  void googelSingUp() async {
    try {
      final GoogleSignInAccount? googleUser = await google.signIn();
      userName = googleUser!.displayName!;
      displayUserPhoto = googleUser.photoUrl;
      var id = googleUser.id;

      isSignIn = true;
      authBox.write("auth", isSignIn);
      update();
      Get.offNamed(Routes.mainScreen);
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.black,
      );
    }
  }

  Future<UserCredential?> facebookSignUp() async {
    /*  final LoginResult loginResult = await FacebookAuth.instance.login();

    if (loginResult.status == LoginStatus.success) {


      final data=await FacebookAuth.instance.getUserData();
      faceBookModel= FaceBookModel.fromJson(data);
      isSignIn=true;
      authBox.write("auth", isSignIn);


      userName=faceBookModel!.name!;

      update();


      Get.offNamed(Routes.mainScreen);
    }*/

/*
// Create an instance of FacebookLogin
    final fb = FacebookLogin();

// Log in
    final res = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);

// Check result status
    switch (res.status) {
      case FacebookLoginStatus.success:
      // Logged in

      // Send access token to server for validation and auth
        final FacebookAccessToken? accessToken = res.accessToken;
        print('Access token: ${accessToken!.token}');

        // Get profile data
        final profile = await fb.getUserProfile();
        print('Hello, ${profile!.name}! You ID: ${profile.userId}');

        // Get user profile image url
        final imageUrl = await fb.getProfileImageUrl(width: 100);
        print('Your profile image: $imageUrl');

        // Get email (since we request email permission)
        final email = await fb.getUserEmail();
        // But user can decline permission
        if (email != null)
          print('And your email is $email');

        break;
      case FacebookLoginStatus.cancel:
      // User cancel log in
        break;
      case FacebookLoginStatus.error:
      // Log in failed
        print('Error while log in: ${res.error}');
        break;
    }*/
  }

  void signOut() async {
    try {
      await auth.signOut();
      await google.signOut();
      await FacebookAuth.i.logOut();
      userName = " ";
      displayUserPhoto = " ";

      isSignIn = false;
      authBox.remove("auth");
      authBox.remove("idUser");
      authBox.remove("username");
      authBox.remove("isLoginUser");
      authBox.remove("isLoginDoctor");
      informationList.clear();
      update();
      Get.offAllNamed(Routes.loginScreen);
    } catch (e) {
      Get.snackbar(
        "Error!",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.blue,
        colorText: Colors.black,
      );
    }
    // google.signOut();
    // auth.signOut();
  }
}
