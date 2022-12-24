// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightcontroller = TextEditingController();
  var feetcontroller = TextEditingController();
  var inchcontroller = TextEditingController();

  var result = "";
  static LinearGradient bgcolor =
      LinearGradient(colors: [Color(0xff5ee7df), Color(0xffb490ca)]);
  var textcolor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        // Appdar of the BMI app
        appBar: AppBar(
          title: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI",
                style:
                    TextStyle(fontFamily: "FredokaOne-Regular", fontSize: 30),
              ),
              Text(
                "Calculator",
              )
            ],
          )),
        ),
        body: Container(
          decoration: BoxDecoration(gradient: bgcolor),
          child: Center(
            child: Container(
              width: 300,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/image/images.png",
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextField(
                      controller: weightcontroller,
                      decoration: InputDecoration(
                          label: Text(
                            "Enter your weight in kg",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          prefixIcon: Icon(Icons.line_weight)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: feetcontroller,
                      decoration: InputDecoration(
                          label: Text(
                            "Enter your height in feet",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: inchcontroller,
                      decoration: InputDecoration(
                          label: Text(
                            "Enter your height in inch",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                          prefixIcon: Icon(Icons.height)),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          var weight = weightcontroller.text.toString();
                          var feet = feetcontroller.text.toString();
                          var inch = inchcontroller.text.toString();
                          if (weight != "" && feet != "" && inch != "") {
                            // Converting into the integer
                            var intweight = int.parse(weight);
                            var intfeet = int.parse(feet);
                            var intinch = int.parse(inch);

                            // coverting feet into inch also inch to cm and cm to meter
                            var total_inch = (intfeet * 12) + intinch;
                            var total_centemeter = total_inch * 2.54;
                            var total_in_meter = total_centemeter / 100;

                            // Actula calculation of BMI using this formula
                            var bmi =
                                intweight / (total_in_meter * total_in_meter);
                            // Variable for give the message
                            var msg = "";

                            FocusManager.instance.primaryFocus?.unfocus();

                            if (bmi > 25) {
                              msg = "You are Overweight!";
                              bgcolor = LinearGradient(colors: const [
                                Color(0xffff5858),
                                Color(0xfff09819),
                              ]);
                              textcolor = Colors.black;
                            } else if (bmi < 18) {
                              msg = "you are Underweight!";
                              bgcolor = LinearGradient(colors: const [
                                Color(0xffdad4ec),
                                Color(0xfff3e7e9),
                              ]);
                              textcolor = Colors.black;
                            } else {
                              msg = "You are Healthy!";
                              bgcolor = LinearGradient(colors: const [
                                Color(0xff0fd850),
                                Color(0xfff9f047),
                              ]);
                              textcolor = Colors.black;
                            }

                            setState(() {
                              result =
                                  "$msg \n Your BMI is: ${bmi.toStringAsFixed(4)}";
                              weightcontroller.clear();
                              feetcontroller.clear();
                              inchcontroller.clear();
                            });
                          } else {
                            setState(() {
                              result = "Please enter the blank filds.";
                              textcolor = Colors.red;
                            });
                          }
                        },
                        child: Text("Calculate")),
                    SizedBox(
                      height: 11,
                    ),
                    Text(
                      result,
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
