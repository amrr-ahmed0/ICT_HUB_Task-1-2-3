import 'package:flutter/material.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {

  static int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(
          "Slider"
        ),
      ),

      body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [

           Container(
             width: 300,
             height: 300,
             decoration: BoxDecoration(
               color: Colors.grey,
               borderRadius: BorderRadius.circular(30),
               image: DecorationImage(
                 image: AssetImage("assets/$index.png"),
                 fit: BoxFit.cover
               )
             ),
           ),

           SizedBox(height: 35),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [

               GestureDetector(
                 onTap: (){
                   setState(() {
                     if(index > 1)
                       index--;
                     else
                       index = 4;
                   });
                 },
                 child: Container(
                   width: 70,
                   height: 70,
                   decoration: const BoxDecoration(
                     color: Colors.grey,
                     shape: BoxShape.circle
                   ),
                   child: const Icon(
                     Icons.arrow_left,
                     size: 70,
                   ),
                 ),
               ),

               Container(
                 width: 70,
                 height: 70,
                 decoration: BoxDecoration(
                     color: Colors.grey,
                     borderRadius: BorderRadius.circular(15)
                 ),
                 child: const Icon(
                   Icons.pause,
                   size: 70,
                 ),
               ),

               GestureDetector(
                 onTap: (){
                   setState(() {
                     if(index < 4)
                       index++;
                     else
                       index = 1;
                   });
                 },
                 child: Container(
                   width: 70,
                   height: 70,
                   decoration: const BoxDecoration(
                       color: Colors.grey,
                       shape: BoxShape.circle
                   ),
                   child: const Icon(
                     Icons.arrow_right,
                     size: 70,
                   ),
                 ),
               ),

             ],
           )

         ],
       ),
      ),

    );
  }
}

