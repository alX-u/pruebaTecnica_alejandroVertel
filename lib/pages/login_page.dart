import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:prueba_tecnica_alejandro_vertel/components/my_button.dart';
import 'package:prueba_tecnica_alejandro_vertel/components/my_textfields.dart';
import 'package:prueba_tecnica_alejandro_vertel/pages/home_page.dart';
import 'package:prueba_tecnica_alejandro_vertel/pages/signup_page.dart';
//GetX
import 'package:get/get.dart';
//Hive
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../controllers/active_user_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  //reference our DB
  final userBox = Hive.box('users');
  final addressBox = Hive.box('addresses');

  //active_user_controller
  ActiveUserController activeUserController = Get.find();

  @override
  void initState() {
    super.initState();
  }

  void readData() {
    //We are going to read the user's data in order to log in
    for (var i = 0; i < userBox.values.toList().length; i++) {
      if (usernameCtrl.text == userBox.values.toList()[i].username &&
          passwordCtrl.text == userBox.values.toList()[i].password) {
        //We store the user's data
        activeUserController.signInUser(
          userBox.values.toList()[i].username,
          userBox.values.toList()[i].name,
          userBox.values.toList()[i].lastName,
          userBox.values.toList()[i].birthDate,
        );
        //We search for the user's addresses
        for (var k = 0; k < addressBox.values.toList().length; k++) {
          if (userBox.values.toList()[i].username ==
              addressBox.values.toList()[k].username) {
            //Here has to be the function that adds it to the dynamic list
            activeUserController
                .addUserAddresses(addressBox.values.toList()[k]);
          }
        }
        print(activeUserController.addresses);
        Get.to(() => HomePage());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          //We center the column
          child: Center(
            //Container for guidance (get rid of it later)
            child: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.grey[300],
              //Column that will store all the things
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  //Logo
                  const Icon(
                    Icons.donut_large_rounded,
                    size: 100,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //Welcome message
                  Text(
                    'Te damos la bienvenida',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 35,
                  ),
                  //username
                  MyTextField(
                      controller: usernameCtrl,
                      obscureText: false,
                      icono: const Icon(FontAwesomeIcons.user),
                      name: 'Usuario'),
                  //password
                  MyTextField(
                      controller: passwordCtrl,
                      obscureText: true,
                      icono: const Icon(FontAwesomeIcons.lock),
                      name: 'Contraseña'),
                  const SizedBox(height: 25),
                  //sign in button
                  MyButton(
                    callback: readData,
                    text: 'Ingresar',
                  ),
                  const SizedBox(height: 25),
                  //Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: Divider(
                      thickness: 3,
                      color: Colors.grey[500],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //new user -> signup
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        '¿Eres un nuevo usuario?',
                        style: TextStyle(color: Colors.grey[700], fontSize: 16),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          //It must take me to the sign up page
                          Get.to(() => SignUpPage());
                          usernameCtrl.clear();
                          passwordCtrl.clear();
                        },
                        child: Text(
                          'Regístrate',
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Spacer(),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
