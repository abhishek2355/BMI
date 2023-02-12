import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String calculateBMI(TextEditingController weightcontroller, TextEditingController feetcontroller, TextEditingController inchcontroller, LinearGradient bgcolor,
    Color textcolor) {
  var weight = weightcontroller.text.toString();
  var feet = feetcontroller.text.toString();
  var inch = inchcontroller.text.toString();

  if (weight != "" && feet != "" && inch != "") {
    // Converting into the integer
    double intweight = double.parse(weight);
    double intfeet = double.parse(feet);
    double intinch = double.parse(inch);

    // coverting feet into inch also inch to cm and cm to meter
    double totalInch = (intfeet * 12) + intinch;
    double totalCentemeter = totalInch * 2.54;
    double totalInMeter = totalCentemeter / 100;

    // Actula calculation of BMI using this formula
    double bmi = intweight / (totalInMeter * totalInMeter);

    FocusManager.instance.primaryFocus?.unfocus();

    return bmi.toStringAsFixed(4);
  }
  return "";
}
