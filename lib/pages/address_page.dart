import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:prueba_tecnica_alejandro_vertel/components/my_address_tile.dart';
import 'package:prueba_tecnica_alejandro_vertel/components/my_button.dart';
import 'package:prueba_tecnica_alejandro_vertel/controllers/active_user_controller.dart';
import 'package:prueba_tecnica_alejandro_vertel/pages/home_page.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({super.key});

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  ActiveUserController userController = Get.find();

  //create new address
  void createNewAddress() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.to(() => HomePage());
                        },
                        child: const Icon(FontAwesomeIcons.arrowLeft, size: 28))
                  ],
                ),
                //Logo
                const Icon(
                  FontAwesomeIcons.solidAddressCard,
                  size: 100,
                ),

                const SizedBox(
                  height: 25,
                ),

                //Welcome message
                Text(
                  'Mis Direcciones',
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: userController.addresses.length,
                        itemBuilder: (context, index) {
                          return MyAddressTile(
                              address: userController.addresses[index].address);
                        }))
                //Expanded(child: ListView.builder())
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewAddress,
        backgroundColor: Colors.black,
        focusColor: Colors.grey[800],
        child: const Icon(FontAwesomeIcons.plus),
      ),
    );
    ;
  }
}
