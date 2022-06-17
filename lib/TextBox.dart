import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  //const TextBox({Key? key}) : super(key: key);
  final TextEditingController _controller;
  final String _labelText;
  TextBox(this._controller, this._labelText);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          filled: true,
          labelText: _labelText,
          suffix: GestureDetector(
            child: const Icon(Icons.close),
            onTap: () {
              _controller.clear();
            },
          ),
        ),
      ),
    );
  }
}
