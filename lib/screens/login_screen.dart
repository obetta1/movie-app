import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movi_app/utils/validation.dart';
import 'package:movi_app/widgets/custom_richtext.dart';

import '../controller/auth_controller.dart';
import '../widgets/widget.dart';
import 'screens.dart';


class LoginScreen extends StatefulWidget {
   const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());
   final formKey = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double wSize = MediaQuery.of(context).size.width;
    double hSize = MediaQuery.of(context).size.height;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: wSize,
              height: hSize * 0.3,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/signup.png'),
                    fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 70,
                          fontWeight: FontWeight.bold),
                    ),
                    CustomText.greyText(
                      'Sign into your account',
                    ),
                    const SizedBox(height: 10),
                    Form(
                      key: formKey,
                        child: Column(children: [
                          CustomInputfield(controller: emailController, label: 'email',
                            icon: Icons.email_rounded,
                            validator: (value) {
                              return Validate.validateEmail(value); },
                          ),
                          CustomInputfield(controller: passwordController, label:
                          'password', icon:  Icons.password_rounded,
                            validator: (value) {
                              return Validate.validatePassword(value);
                            },
                          ),

                          const SizedBox(height: 10,),
                          CustomButton(wSize: wSize, hSize: hSize,label: 'Login', onTap: (){
                            if(formKey.currentState!.validate()){
                              authController.login(emailController.text, passwordController.text);
                            }
                          }),
                    ],)),

                    const SizedBox(
                      height: 20,
                    ),
                    CustomRichText(  title: 'Don\'t have an account?', spanText: ' SignUP', onPressed: ()=>Get.to(SignUpScreen())),


                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
