import 'package:firts_crud/my_home_page.dart';
import 'package:flutter/material.dart';
import 'TextBox.dart';

class ModifityContact extends StatefulWidget {
  //ModifityContact({Key? key}) : super(key: key);

  final Cliente _cliente;
  ModifityContact(this._cliente);

  @override
  State<ModifityContact> createState() => _ModifityContactState();
}

class _ModifityContactState extends State<ModifityContact> {
  late TextEditingController controllerName;
  late TextEditingController controllerSurname;
  late TextEditingController controllerPhone;

  @override
  void initState() {
    Cliente c = widget._cliente;
    controllerName = TextEditingController(text: c.name);
    controllerSurname = TextEditingController(text: c.surname);
    controllerPhone = TextEditingController(text: c.phone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modificar Contacto'),
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
