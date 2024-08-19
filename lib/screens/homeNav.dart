import 'package:flutter/material.dart';
import 'package:ict_hub_task_1_2_3/screens/task1.dart';
import 'package:ict_hub_task_1_2_3/screens/task2.dart';
import 'package:ict_hub_task_1_2_3/screens/textFormField.dart';

import 'GridView.dart';

class homeNav extends StatefulWidget {
  const homeNav({super.key});

  @override
  State<homeNav> createState() => _homeNavState();
}

class _homeNavState extends State<homeNav> {

  List<Widget> _screens = [
    Task1(),
    Task2(),
    GridViewTest(),
    TextFieldTest(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[_index],

      bottomNavigationBar: BottomNavigationBar(
        //fixedColor: Colors.grey,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: _index,

        onTap: (index){
          setState(() {
            _index = index;
          });
        },

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.onetwothree_outlined), label: "Counter"),
          BottomNavigationBarItem(icon: Icon(Icons.slideshow), label: "Slider"),
          BottomNavigationBarItem(icon: Icon(Icons.grid_on_outlined), label: "Grid View"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "Calculator"),
        ],
      ),

    );
  }
}
