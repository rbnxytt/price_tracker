import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.city,
  }) : super(key: key);
  final String city;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 100.0,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            city,
            style: const TextStyle(fontSize: 10.0),
          ),
        ),
      ),
      title: const TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          hintText: 'Enter Price Here',
          hintStyle: TextStyle(fontSize: 10.0),
        ),
      ),
    );
  }
}