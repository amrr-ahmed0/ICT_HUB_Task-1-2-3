import 'package:flutter/material.dart';

import 'custom_text.dart';

class AppErrorWidget extends StatelessWidget {

  final String errorMessage;
  final Function()? onTryagain;

  const AppErrorWidget({super.key, required this.errorMessage, this.onTryagain});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: TextStyle(
                color: Colors.red,
                fontSize: 40
            ),
          ),

          CustomText(
            data: "Loading Products Failed",
          ),

          SizedBox(height: 15,),

          if(onTryagain != null)
            ElevatedButton(
                onPressed: onTryagain,
                child: const Text("Try Again")
            )
        ],
      ),
    );
  }
}
