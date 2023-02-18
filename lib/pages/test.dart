import 'package:flutter/material.dart';

class name extends StatefulWidget {
  const name({super.key});

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  var selecteditrrm = 'USA';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        DropdownButton(
          items: ['USA', 'KSA']
              .map((e) => DropdownMenuItem(
                    child: Text('$e'),
                    value: e,
                  ))
              .toList(),
          onChanged: (value) {},
          value: selecteditrrm,
        )
      ]),
    );
  }
}
