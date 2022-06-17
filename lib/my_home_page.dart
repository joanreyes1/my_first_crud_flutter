import 'package:firts_crud/modifity_contact.dart';
import 'package:flutter/material.dart';
import 'registrer_contact.dart';
import 'message_responsive.dart';

class MyPageHome extends StatefulWidget {
  final String _title;
  MyPageHome(this._title);

  @override
  State<MyPageHome> createState() => _MyPageHomeState();
}

class _MyPageHomeState extends State<MyPageHome> {
  List<Cliente> clientes = [
    Cliente(name: 'Will', surname: 'Mora', phone: '302 454 25 93'),
    Cliente(name: 'Sam', surname: 'Perez', phone: '322 412 34 68'),
    Cliente(name: 'Marlon', surname: 'Gutierrez', phone: '301 441 36 98'),
    Cliente(name: 'Jhon', surname: 'Segura', phone: '310 789 90 62')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget._title),
      ),
      body: ListView.builder(
        itemCount: clientes.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ModifityContact(clientes[index])))
                  .then((newContact) {
                if (newContact != null) {
                  setState(() {
                    clientes.removeAt(index);
                    clientes.insert(index, newContact);
                    messageResponsive(
                        context, newContact.name + 'a sido actualizado!');
                  });
                }
              });
            },
            onLongPress: () {
              removeClient(context, clientes[index]);
            },
            title: Text(clientes[index].name + " " + clientes[index].surname),
            subtitle: Text(clientes[index].phone),
            leading: CircleAvatar(
              child: Text(clientes[index].name.substring(0, 1)),
            ),
            trailing: const Icon(
              Icons.call,
              color: Colors.red,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (_) => RegisterContants()))
              .then((newContact) {
            if (newContact != null) {
              setState(() {
                clientes.add(newContact);
                messageResponsive(
                    context, newContact.name + " a sido guardado!");
              });
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  removeClient(BuildContext context, Cliente cliente) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: const Text('Eliminar Cliente'),
              content: Text(
                  'Esta seguro que desea eliminar a: ' + cliente.name + ' ?'),
              actions: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      clientes.remove(cliente);
                      Navigator.pop(context);
                    });
                  },
                  child: const Text(
                    'Eliminar',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Cancelar',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    )),
              ],
            ));
  }
}

class Cliente {
  var name;
  var surname;
  var phone;

  Cliente({this.name, this.surname, this.phone});
}
