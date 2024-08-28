import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ict_hub_task_1_2_3/auth/app_auth.dart';
import 'package:ict_hub_task_1_2_3/cubits/counter_cubit/cubit.dart';
import 'package:ict_hub_task_1_2_3/cubits/products_cubit/cubit.dart';
import 'package:ict_hub_task_1_2_3/cubits/slider_cubit/cubit.dart';
import 'package:ict_hub_task_1_2_3/ui/screens/profile.dart';
import 'package:ict_hub_task_1_2_3/ui/screens/task1.dart';
import 'package:ict_hub_task_1_2_3/ui/screens/task2.dart';
import 'package:ict_hub_task_1_2_3/ui/screens/textFormField.dart';
import '../widgets/custom_elevatedButton.dart';
import 'GridView.dart';
import 'apiTest.dart';

class homeNav extends StatefulWidget {
  const homeNav({super.key});

  @override
  State<homeNav> createState() => _homeNavState();
}

class _homeNavState extends State<homeNav> {
  final List<Widget> _screens = const [
    Task1(),
    Task2(),
    GridViewTest(),
    TextFieldTest(),
    ApiTest(),
    ProfileScreen(),
  ];

  final List<String> titles = [
    "Counter",
    "Slider",
    "Grid View",
    "Calculator",
    "Api Test",
    "Profile",
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(create: (context) => CounterCubit()),
        BlocProvider<ProductsCubit>(
            create: (context) => ProductsCubit()..getProducts()),
        BlocProvider<SliderCubit>(create: (context) => SliderCubit())
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(titles[_index]),
        ),
        body: _screens[_index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          showSelectedLabels: true,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.onetwothree_outlined,
                  size: 35,
                ),
                label: "Counter"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.slideshow,
                  size: 35,
                ),
                label: "Slider"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.grid_on_outlined,
                  size: 35,
                ),
                label: "Grid View"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.calculate,
                  size: 35,
                ),
                label: "Calculator"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.api,
                  size: 35,
                ),
                label: "Api"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 35,
                ),
                label: "Profile"),
          ],
        ),
        drawer: Drawer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomElevatedButton(
                text: "Sign Out",
                onPressed: () {
                  AppAuth.signOut(context);
                },
                textSize: 24,
              )
            ],
          ),
        ),
      ),
    );
  }
}
