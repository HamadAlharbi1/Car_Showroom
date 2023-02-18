import 'package:flutter/material.dart';

class EditableTextField extends StatefulWidget {
  @override
  _EditableTextFieldState createState() => _EditableTextFieldState();
}

class _EditableTextFieldState extends State<EditableTextField> {
  bool _isEditable = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isEditable = true;
          });
        },
        child: _isEditable
            ? TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Enter your text',
                ),
              )
            : const Text(
                'Click to edit',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
      ),
    );
  }
}
