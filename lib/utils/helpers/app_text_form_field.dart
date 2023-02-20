import 'package:bmi/utils/constant/app_heights.dart';
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
    var media = MediaQuery.of(context).size;
    return SizedBox(
      child: TextFormField(
        controller: weightcontroller,
        style: TextStyle(fontSize: media.height * height25),
        decoration: InputDecoration(
          hintText: textFormFieldsLableText,
          hintStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
          prefixIcon: iconField,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}
