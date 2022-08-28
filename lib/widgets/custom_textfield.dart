import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.city,
    this.controller,
  }) : super(key: key);
  final String city;
  final TextEditingController? controller;

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
      title: TextFormField(
        validator: (value) {
          try {
            if (value == null || value.isEmpty || double.parse(value).isNaN) {
              return 'Check your entries.';
            }
          } on FormatException {
            return 'Enter a valid entry.';
          }
          return null;
        },
        autocorrect: false,
        controller: controller,
        textAlign: TextAlign.center,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(
          hintText: 'Enter Price Here',
          hintStyle: TextStyle(fontSize: 10.0),
        ),
      ),
    );
  }
}
