import 'package:flutter/material.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  static int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
              child: const Icon(
                Icons.remove,
                size: 40,
              ),
              backgroundColor: Colors.grey,
            ),
            Text(
              "$counter",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Icon(
                Icons.add,
                size: 40,
              ),
              backgroundColor: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
