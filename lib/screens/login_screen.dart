import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movi_app/utils/validation.dart';
import 'package:movi_app/widgets/custom_richtext.dart';

import '../controller/auth_controller.dart';
import '../widgets/widget.dart';
import 'screens.dart';


class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    double wSize = MediaQuery.of(context).size.width;
    double hSize = MediaQuery.of(context).size.height;
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return Scaffold(
      body: Column(
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
                  CustomInputfield(controller: emailController, label: 'email', icon: Icons.email_rounded,),
                  CustomInputfield(controller: passwordController, label:  'password', icon:  Icons.password_rounded,),
                  SizedBox(height: 40,),
                  CustomButton(wSize: wSize, hSize: hSize,label: 'Login', onTap: (){
                    if(Validate.validateEmail(emailController.text) && Validate.validatePassword(passwordController.text)) { authController.login(emailController.text, passwordController.text);
                    }
                  }),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomRichText(title: 'Don\'t have an account?', spanText: ' SignUP', onPressed: ()=>Get.to(SignUpScreen()))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
