import 'package:flutter/material.dart';

import '../widgets/custom_text.dart';
import '../widgets/custom_textFormField.dart';

class TextFieldTest extends StatefulWidget {
  const TextFieldTest({super.key});

  @override
  State<TextFieldTest> createState() => _TextFieldTestState();
}

class _TextFieldTestState extends State<TextFieldTest> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int? result;

  var controller1 = TextEditingController();
  var controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    data: "Number 1",
                    hint: "Enter First Number",
                    controller: controller1,
                    validator: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          result = null;
                        });
                        return "Number 1 is required";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    data: "Number 2",
                    hint: "Enter Second Number",
                    controller: controller2,
                    validator: (value) {
                      if (value!.isEmpty) {
                        setState(() {
                          result = null;
                        });
                        return "Number 2 is required";
                      }
                      return null;
                    },
                  ),
                  Text(
                    '${result ?? ''}',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          int n1 = int.parse(controller1.text);
                          int n2 = int.parse(controller2.text);
                          result = n1 + n2;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    child: CustomText(
                      data: "Calculate",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
