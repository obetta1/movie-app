import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movi_app/controller/auth_controller.dart';
import 'package:movi_app/screens/login_screen.dart';

import 'package:movi_app/utils/validation.dart';
import 'package:movi_app/widgets/custom_richtext.dart';

import '../widgets/widget.dart';

class SignUpScreen extends StatelessWidget {
   SignUpScreen({Key? key}) : super(key: key);
  final AuthController authController = Get.put(AuthController());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var wSize = MediaQuery.of(context).size.width;
    var hSize = MediaQuery.of(context).size.height;
    final TextEditingController fullName = TextEditingController();
    final TextEditingController email = TextEditingController();
    final TextEditingController city = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController confirmPassword = TextEditingController();

    ///this is list of images used for social media sign up
    List images = [
      'g.png',
      'f.png',
      't.png'
    ];
    return  Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: wSize,
              height: hSize * 0.2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/signup.png'),
                    fit: BoxFit.fill),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: hSize * 0.1 ,
                  ),
                  CustomText.headLine(
                    'Create account',
                  ),
                ],
              ),
            ),

          Form(

            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
              child: Column(
                children: [
                  CustomInputfield(
                      controller: fullName,
                      label: 'fullName',
                      icon: Icons.person, validator: (value) { return Validate.validateField(value);}),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomInputfield(
                    controller: email,
                    label: 'email address',
                    icon: Icons.email_rounded, validator: (value) {return  Validate.validateEmail(value); },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomInputfield(
                      controller: city,
                      label: 'city',
                      icon: Icons.location_city, validator: (value) { return Validate.validateField(value); },),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomInputfield(
                    controller: password,
                    label: 'password',
                    icon: Icons.password_rounded, validator: (value) {return Validate.validatePassword(value); },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomInputfield(
                      controller: confirmPassword,
                      label: 'confirm password',
                      icon: Icons.password_rounded, validator: (value) {return Validate.validateField(value); },),
                  const SizedBox(
                    height: 10,
                  ),

                  CustomButton(label: 'Save' ,wSize: wSize, hSize: hSize, onTap: ()=>{
                    if(formKey.currentState!.validate()){
                    authController.registerUser(email.text, password.text),
                    }
                  }),
                ],
              ),
            ),
          ),
            const SizedBox(
              height: 10,
            ),
            CustomRichText(title: 'Already have an account?', spanText: 'Login here', onPressed: ()=> Get.to(const LoginScreen())),
            const SizedBox(
              height: 20,
            ),
            CustomText.greyText('Sign up using one of the following',),
            Center(
              child: Wrap(
                children: List<Widget>.generate(
                    3, (index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[700],
                      child: CircleAvatar(
                        radius: 23,
                        backgroundImage: AssetImage('assets/images/${images[index]}'),
                      ),
                    ),
                  );
                }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
