import 'package:flutter/material.dart';
import 'package:movi_app/widgets/custom_imput_field.dart';

import '../widgets/widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var wSize = MediaQuery.of(context).size.width;
    var hSize = MediaQuery.of(context).size.height;
    final TextEditingController fullName = TextEditingController();
    final TextEditingController address = TextEditingController();
    final TextEditingController city = TextEditingController();
    final TextEditingController country = TextEditingController();
    final TextEditingController zipcode = TextEditingController();

    List images = [
      'g.png',
      'f.png',
      't.png'
    ];
    return  Scaffold(
      //bottomNavigationBar: CustomNavBar(screen: '',),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
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

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: Column(
            children: [
              CustomInputfield(
                  controller: fullName,
                  label: 'fullName',
                  icon: Icons.person),
              const SizedBox(
                height: 10,
              ),
              CustomInputfield(
                controller: address,
                label: 'email address',
                icon: Icons.email_rounded,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomInputfield(
                  controller: city,
                  label: 'city',
                  icon: Icons.location_city),
              const SizedBox(
                height: 10,
              ),
              CustomInputfield(
                controller: country,
                label: 'password',
                icon: Icons.password_rounded,
              ),
              const SizedBox(
                height: 10,
              ),
              CustomInputfield(
                  controller: zipcode,
                  label: 'comfirm password',
                  icon: Icons.password_rounded),
              const SizedBox(
                height: 10,
              ),

              CustomButton(label: 'Save' ,wSize: wSize, hSize: hSize, onTap: (){

              }),
            ],
          ),
        ),

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
                      backgroundImage: AssetImage('assets/images/'+images[index]),
                    ),
                  ),
                );
              }
              ),
            ),
          )
        ],
      ),
    );
  }
}
