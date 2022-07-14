import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class DialogMessage {
  static successDialog(context, String content) {
    return AwesomeDialog(
      context: context,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.SUCCES,
      body: Center(
        child: Text(
          content,
          style: const TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
      //  title: title,
      desc: 'This is also Ignored',
      btnOkOnPress: () {

      },
    )..show();
  }

  static errorsDialog(context, String content) {
    return AwesomeDialog(
      btnOkColor: Colors.orange,
      context: context,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.ERROR,
      body: Center(
        child: Text(
          content,
          style: const TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
      //  title: title,
      desc: 'This is also Ignored',
      btnOkOnPress: () {},
    )..show();
  }

  static warningDialog(context, String content) {
    return AwesomeDialog(
      btnOkColor: Colors.orange,
      context: context,
      animType: AnimType.BOTTOMSLIDE,
      dialogType: DialogType.WARNING,
      body: Center(
        child: Text(
          content,
          style: const TextStyle(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
      ),
      //  title: title,
      desc: 'This is also Ignored',
      btnOkOnPress: () {},
    )..show();
  }

  static showDialogLoading(context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text("يتم تحديد اقرب مشفى إليك "),
              CircularProgressIndicator(),
            ],
          ));
        });
  }

  static showDialogEdit(
      context, formstatesignin, information, myController, pass, myhinttext) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: Form(
            key: formstatesignin,
            child: Container(
              height: 250,
              child: Column(
                children: [
                  TextFormField(
                    controller: myController,
                    validator: (value) {
                      if (value.toString().length <= 5) {
                        return "Invalid address";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        hintText: myhinttext,
                        filled: true,
                        fillColor: Colors.grey[200],
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green,
                                style: BorderStyle.solid,
                                width: 1))),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5, top: 10)),
                  Container(
                      height: 80,
                      //width: 100,
                      child: Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 20)),
                          DialogButton(
                            child: Text(
                              "الغاء",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.deepPurple,
                          ),
                          Padding(padding: EdgeInsets.only(right: 70)),
                          DialogButton(
                            child: Text(
                              "تأكيد",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            onPressed: () {
                              //   edit_adress_user();
                            },
                            color: Colors.red,
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ));
        });
  }
/*
TextFormField buildTextFormField2(String myhinttext, bool pass,
    TextEditingController myController, myvalid ) {
  return  TextFormField(
    controller: myController,
    obscureText: pass,
    validator: myvalid,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.all(4),
        hintText: myhinttext,
        filled: true,
        fillColor: Colors.grey[200],
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.grey, style: BorderStyle.solid, width: 1)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Colors.green,
                style: BorderStyle.solid,
                width: 1))),
  );*/
}
