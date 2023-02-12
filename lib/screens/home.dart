import 'package:bmi/screens/result.dart';
import 'package:bmi/utils/constant/app_color.dart';
import 'package:bmi/utils/constant/app_heights.dart';
import 'package:bmi/utils/constant/app_string.dart';
import 'package:bmi/utils/constant/app_text_style.dart';
import 'package:bmi/utils/constant/app_width.dart';
import 'package:bmi/utils/helpers/app_text_form_field.dart';
import 'package:bmi/utils/helpers/sizebox.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  // text form fields veriables
  var weightcontroller = TextEditingController();
  var feetcontroller = TextEditingController();
  var inchcontroller = TextEditingController();

// result variables
  var result = '';
  var finalresult = '';
  var textcolor = appTextColor;

// Basic color for the app
  static LinearGradient bgcolor = const LinearGradient(colors: [homeScreenColor1, homeScreenColor2]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Appdar of the BMI app
        appBar: AppBar(
          title: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                navBarHeading,
                style: TextStyle(fontFamily: fredokaOnefontStyle, fontSize: 30),
              ),
              Text(
                navBarSubHeading,
              )
            ],
          )),
        ),
        body: Container(
          decoration: BoxDecoration(gradient: bgcolor),
          child: Center(
            child: SizedBox(
              width: width300,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // BMI Image
                    Image.asset(
                      homePageImagePath,
                      width: width100,
                      height: height100,
                    ),

                    // sizeBox with the height 11
                    const SizeBoxApp(heightOfSizeBox: height11),

                    // weight textformfield
                    TextFormFields(
                      weightcontroller: weightcontroller,
                      textFormFieldsLableText: weightTextFormFieldHintText,
                      iconField: const Icon(Icons.line_weight),
                    ),

                    // SizeBox with the height 11
                    const SizeBoxApp(
                      heightOfSizeBox: height11,
                    ),

                    // height in feet textformfield
                    TextFormFields(
                        weightcontroller: feetcontroller,
                        textFormFieldsLableText: heightInFeetTextFormFieldHintText,
                        iconField: const Icon(Icons.height_outlined)),

                    // SizeBox with the height 11
                    const SizeBoxApp(
                      heightOfSizeBox: height11,
                    ),

                    //  height in inches textformfield
                    TextFormFields(
                        weightcontroller: inchcontroller,
                        textFormFieldsLableText: heightInInchesTextFormFieldHintText,
                        iconField: const Icon(Icons.height_rounded)),

                    // SizeBox with the height 21
                    const SizeBoxApp(
                      heightOfSizeBox: height21,
                    ),

                    // Calculate Button
                    ElevatedButton(
                        onPressed: () {
                          var msg = "";

                          result = calculateBMI(weightcontroller, feetcontroller, inchcontroller, bgcolor, textcolor);

                          setState(() {
                            if (result != "") {
                              if (double.parse(result) > 25) {
                                msg = overWeightMessage;
                                bgcolor = const LinearGradient(colors: [
                                  overweightColor1,
                                  overWeightColor2,
                                ]);
                                textcolor = Colors.black;
                              } else if (double.parse(result) < 18) {
                                msg = underWeightMessage;
                                bgcolor = const LinearGradient(colors: [
                                  underWeightColor1,
                                  underWeightColor2,
                                ]);
                                textcolor = appTextColor;
                              } else {
                                msg = healthiMessage;
                                bgcolor = const LinearGradient(colors: [
                                  healthicolor1,
                                  healthicolor2,
                                ]);
                                textcolor = appTextColor;
                              }
                            }
                            weightcontroller.clear();
                            feetcontroller.clear();
                            inchcontroller.clear();
                          });

                          if (result == "") {
                            finalresult = emptyFieldAlertMessage;
                          } else {
                            finalresult = "$msg \n Your BMI is: $result";
                          }
                        },
                        child: const Text(homePageButtonText)),

                    // Sizebox with height 11
                    const SizeBoxApp(
                      heightOfSizeBox: height11,
                    ),

                    Text(
                      finalresult,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 19,
                        color: textcolor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
