import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ict_hub_task_1_2_3/data/data%20model/user_model.dart';
import 'package:ict_hub_task_1_2_3/data/data%20source/profile_data_source.dart';
import 'package:ict_hub_task_1_2_3/screens/LoginScreen.dart';
import 'package:ict_hub_task_1_2_3/widgets/custom_text.dart';

import '../screens/homeNav.dart';

class AppAuth {
  static Future register(
      {required String mail,
      required String pass,
      required BuildContext context,
      required String name,
      required String phone}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final snackdemo = SnackBar(
        content: CustomText(
          data: "User Registered Successfully",
          fontColor: Colors.white,
        ),
        backgroundColor: Colors.green,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );

      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: mail,
        password: pass,
      )
          .then((value) {
        if (value.user != null) {
          SaveNewUserToDB(
              mail: mail,
              pass: pass,
              uid: value.user!.uid,
              name: name,
              phone: phone);
        }
      });
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => homeNav()), (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    } on FirebaseAuthException catch (e) {
      final snackdemo = SnackBar(
        content: CustomText(
          data:
              "Email may be registered before\nCheck your credentials and try again",
          fontColor: Colors.white,
        ),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
    } catch (e) {
      print(e);
    }
  }

  //!======================================================================

  static Future<void> SaveNewUserToDB(
      {required String mail,
      required String pass,
      required String uid,
      required String name,
      required String phone}) async {
    await FirebaseFirestore.instance.collection("users").doc(uid).set({
      'name': name,
      'email': mail,
      'password': pass,
      'UID': uid,
      'phoneNumber': phone
    });
  }

  //!======================================================================

  static Future login(
      {required String mail,
      required String pass,
      required BuildContext context}) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      final snackdemo = SnackBar(
        content: CustomText(
          data: "Logged in Successfully",
          fontColor: Colors.white,
        ),
        backgroundColor: Colors.green,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );

      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail, password: pass);
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => homeNav()), (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(snackdemo);
    } on FirebaseAuthException catch (e) {
      final snackdemo = SnackBar(
        content: CustomText(
          data: "Check your credentials and try again!!",
          fontColor: Colors.white,
        ),
        backgroundColor: Colors.red,
        elevation: 10,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.all(5),
      );

      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackdemo);
      }
    }
  }

  //!======================================================================

  static Future signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    ProfileDataSource.user = null;
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }

//!======================================================================

// static UserModel getUser() {
//   final User? user = FirebaseAuth.instance.currentUser;
//   return UserModel(
//     email: user!.email,
//     uid: user.uid,
//   );
// }

//!======================================================================
}
