import 'package:flutter/material.dart';
import 'package:ict_hub_task_1_2_3/screens/homeNav.dart';

void main() {
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          scrolledUnderElevation: 0.0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          color: Colors.grey
        )
      ),
      home: homeNav(),
    );
  }
}