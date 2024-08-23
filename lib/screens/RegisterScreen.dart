import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ict_hub_task_1_2_3/auth/app_auth.dart';
import 'package:ict_hub_task_1_2_3/screens/LoginScreen.dart';
import 'package:ict_hub_task_1_2_3/widgets/custom_text.dart';

import '../validator/validator.dart';
import '../widgets/custom_elevatedButton.dart';
import '../widgets/custom_textFormField.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var emailReg = TextEditingController();
  var passwordReg = TextEditingController();
  var nameReg = TextEditingController();
  var phoneReg = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      data: "Register",
                      fontSize: 24,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      data: "Email",
                      controller: emailReg,
                      validator: AppValidator.validateText,
                      hint: "Enter Email",
                      prefixIcon: Icon(Icons.mail),
                      keyBoardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      data: "Name",
                      controller: nameReg,
                      validator: AppValidator.validateText,
                      hint: "Enter Name",
                      prefixIcon: Icon(Icons.person),
                      keyBoardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      data: "Phone",
                      controller: phoneReg,
                      validator: AppValidator.validateText,
                      hint: "Enter Phone Number",
                      prefixIcon: Icon(Icons.phone),
                      keyBoardType: TextInputType.phone,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        data: "Password",
                        controller: passwordReg,
                        keyBoardType: TextInputType.text,
                        obsecurText: isVisible,
                        validator: AppValidator.validateText,
                        hint: "Enter Password",
                        suffixIcon: InkWell(
                            onTap: () {
                              isVisible = !isVisible;
                              setState(() {});
                            },
                            child: isVisible
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        prefixIcon: const Icon(
                          Icons.lock,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      child: CustomElevatedButton(
                        isLoading: isLoading,
                        text: "Register",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            await AppAuth.register(
                              mail: emailReg.text,
                              pass: passwordReg.text,
                              context: context,
                              name: nameReg.text,
                              phone: phoneReg.text,
                            );
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                        borderRadius: 10,
                      ),
                    ),
                    Align(
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: CustomText(
                            data: "Already have an account? Sign in",
                            fontSize: 16,
                            fontColor: Colors.blue,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
