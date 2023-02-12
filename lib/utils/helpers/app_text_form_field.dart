import 'package:flutter/material.dart';

class TextFormFields extends StatelessWidget {
  const TextFormFields({
    Key? key,
    required this.weightcontroller,
    required this.textFormFieldsLableText,
    required this.iconField,
  }) : super(key: key);

  final TextEditingController weightcontroller;
  final String textFormFieldsLableText;
  final Icon iconField;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        controller: weightcontroller,
        decoration: InputDecoration(
            label: Text(
              textFormFieldsLableText,
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            prefixIcon: iconField),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
