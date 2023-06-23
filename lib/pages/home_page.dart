import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:prueba_tecnica_alejandro_vertel/pages/login_page.dart';

import '../components/my_readonly_textfields.dart';
import '../components/my_textfields.dart';
import '../controllers/active_user_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  ActiveUserController activeUserController = Get.find();

  //reference our DB
  final userBox = Hive.box('users');

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
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            Get.to(() => const LoginPage());
                          },
                          child:
                              const Icon(FontAwesomeIcons.arrowLeft, size: 28))
                    ],
                  ),

                  //Logo
                  const Icon(
                    Icons.data_array,
                    size: 100,
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  //Welcome message
                  Text(
                    'Tu información',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(
                    height: 35,
                  ),
                  //Username
                  MyReadOnlyTextField(
                      labelText: 'Usuario',
                      initialValue: activeUserController.getUsername),
                  //Name
                  MyReadOnlyTextField(
                      labelText: 'Nombres',
                      initialValue: activeUserController.getName),
                  //LastName
                  MyReadOnlyTextField(
                      labelText: 'Apellidos',
                      initialValue: activeUserController.getLastName),
                  //Birth Date
                  MyReadOnlyTextField(
                      labelText: 'Fecha de Nacimiento',
                      initialValue: activeUserController.getBirthDate),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
