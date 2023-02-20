import 'package:bmi/screens/result.dart';
import 'package:bmi/utils/constant/app_color.dart';
import 'package:bmi/utils/constant/app_heights.dart';
import 'package:bmi/utils/constant/app_string.dart';
import 'package:bmi/utils/constant/app_text_style.dart';
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
    var media = MediaQuery.of(context).size;
    return Scaffold(

        // Appbar of the BMI app
        appBar: AppBar(
          toolbarHeight: media.height * height80,
          title: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                navBarHeading,
                style: TextStyle(fontFamily: fredokaOnefontStyle, fontSize: media.height * 40 / 926),
              ),
              Text(
                navBarSubHeading,
                style: TextStyle(fontSize: media.height * 30 / 926),
              )
            ],
          )),
        ),

        // Body of the BMI app
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            decoration: BoxDecoration(gradient: bgcolor),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox of the height 80
                  const SizedBoxBMI(heightOfSizeBox: height80),

                  // Image of BMI
                  SizedBoxBMI(
                    heightOfSizeBox: height100,
                    child_of_BMI: Image.asset(
                      homePageImagePath,
                    ),
                  ),

                  // sizeBox with the height 80
                  const SizedBoxBMI(
                    heightOfSizeBox: height80,
                  ),

                  // weight textformfield
                  SizedBoxBMI(
                    heightOfSizeBox: height50,
                    child_of_BMI: TextFormFields(
                      weightcontroller: weightcontroller,
                      textFormFieldsLableText: weightTextFormFieldHintText,
                      iconField: Icon(
                        Icons.line_weight,
                        size: media.height * height25,
                        color: Colors.green,
                      ),
                    ),
                  ),

                  // sizeBox with the height 20
                  const SizedBoxBMI(
                    heightOfSizeBox: height20,
                  ),

                  // Height in feets textformfield
                  SizedBoxBMI(
                    heightOfSizeBox: height50,
                    child_of_BMI: TextFormFields(
                        weightcontroller: feetcontroller,
                        textFormFieldsLableText: heightInFeetTextFormFieldHintText,
                        iconField: Icon(
                          Icons.height_outlined,
                          size: media.height * height25,
                          color: Colors.green,
                        )),
                  ),

                  // sizeBox with the height 20
                  const SizedBoxBMI(
                    heightOfSizeBox: height20,
                  ),

                  // Height in inches TextFormFields
                  SizedBoxBMI(
                    heightOfSizeBox: height50,
                    child_of_BMI: TextFormFields(
                        weightcontroller: inchcontroller,
                        textFormFieldsLableText: heightInInchesTextFormFieldHintText,
                        iconField: Icon(
                          Icons.height_rounded,
                          size: media.height * height25,
                          color: Colors.green,
                        )),
                  ),

                  // sizeBox with the height 80
                  const SizedBoxBMI(
                    heightOfSizeBox: height80,
                  ),

                  // Calculate Button
                  SizedBoxBMI(
                    heightOfSizeBox: height50,
                    child_of_BMI: ElevatedButton(
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
                        child: Text(
                          homePageButtonText,
                          style: TextStyle(fontSize: media.height * height25),
                        )),
                  ),

                  // sizeBox with the height 40
                  const SizedBoxBMI(
                    heightOfSizeBox: height40,
                  ),

                  // Final result with BMI
                  SizedBoxBMI(
                    heightOfSizeBox: height30,
                    child_of_BMI: Center(
                      child: Text(
                        finalresult,
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: media.height * height25,
                          color: textcolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBoxBMI(
                    heightOfSizeBox: height186,
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
