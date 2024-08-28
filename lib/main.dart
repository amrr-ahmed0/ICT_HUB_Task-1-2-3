import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_task_1_2_3/core/bloc_observer.dart';
import 'package:ict_hub_task_1_2_3/firebase_options.dart';
import 'package:http/http.dart' as http;
import 'package:ict_hub_task_1_2_3/ui/screens/LoginScreen.dart';
import 'package:ict_hub_task_1_2_3/ui/screens/homeNav.dart';

Future<bool> getProductsData() async {
  var response = await http.get(Uri.parse('https://dummyjson.com/products'));

  if (response.statusCode == 200) {
    try {
      Map<String, dynamic> data = jsonDecode(response.body);

      List<dynamic> productsList = data['products'];

      for (Map<String, dynamic> item in productsList) {
        await saveItemToProductsCollection(item);
      }

      return true;
    } catch (e) {
      return false;
    }
  }
  {
    return false;
  }
}

Future<void> saveItemToProductsCollection(Map<String, dynamic> item) async {
  await FirebaseFirestore.instance.collection('products').add(item);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
              scrolledUnderElevation: 0.0,
              centerTitle: true,
              titleTextStyle: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
              color: Colors.grey)),
      home:
          FirebaseAuth.instance.currentUser != null ? homeNav() : LoginScreen(),
    );
  }
}
