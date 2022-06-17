import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

messageResponsive(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (_) => AlertDialog(
            title: const Text('Mensaje Informativo....!'),
            content: Text("El Contacto" + name),
          ));
}
