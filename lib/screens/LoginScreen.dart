import 'package:flutter/material.dart';
import 'package:ict_hub_task_1_2_3/auth/app_auth.dart';
import 'package:ict_hub_task_1_2_3/screens/RegisterScreen.dart';
import 'package:ict_hub_task_1_2_3/screens/homeNav.dart';
import 'package:ict_hub_task_1_2_3/validator/validator.dart';
import 'package:ict_hub_task_1_2_3/widgets/custom_elevatedButton.dart';
import 'package:ict_hub_task_1_2_3/widgets/custom_textFormField.dart';

import '../widgets/custom_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var email = TextEditingController();
  var password = TextEditingController();
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
                      data: "Login",
                      fontSize: 24,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      data: "Email",
                      controller: email,
                      validator: AppValidator.validateText,
                      hint: "Enter Email",
                      prefixIcon: Icon(Icons.mail),
                      keyBoardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                        data: "Password",
                        controller: password,
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
                                ? Icon(Icons.visibility)
                                : Icon(Icons.visibility_off)),
                        prefixIcon: Icon(
                          Icons.lock,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      child: CustomElevatedButton(
                        isLoading: isLoading,
                        text: "Login",
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            await AppAuth.login(
                                mail: email.text,
                                pass: password.text,
                                context: context);
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
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                                (route) => false);
                          },
                          child: CustomText(
                            data: "Don't have an account? Register now",
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
