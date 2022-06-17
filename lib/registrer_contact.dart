import 'package:firts_crud/my_home_page.dart';
import 'package:flutter/material.dart';
import 'TextBox.dart';

class RegisterContants extends StatefulWidget {
  RegisterContants({Key? key}) : super(key: key);

  @override
  State<RegisterContants> createState() => _RegisterContantsState();
}

class _RegisterContantsState extends State<RegisterContants> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  @override
  void initState() {
    controllerName = TextEditingController();
    controllerSurname = TextEditingController();
    controllerPhone = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Contacto'),
      ),
      body: ListView(
        children: [
          TextBox(controllerName, "Name"),
          TextBox(controllerSurname, "Apellido"),
          TextBox(controllerPhone, "Teléfono"),
          ElevatedButton(
            onPressed: () {
              String name = controllerName.text;
              String surname = controllerSurname.text;
              String phone = controllerPhone.text;

              if (name.isNotEmpty && surname.isNotEmpty && phone.isNotEmpty) {
                Navigator.pop(context,
                    Cliente(name: name, surname: surname, phone: phone));
              }
            },
            child: const Text('Guardar Contacto'),
          ),
        ],
      ),
    );
  }
}
