import 'package:flutter/cupertino.dart';

class SizedBoxBMI extends StatelessWidget {
  const SizedBoxBMI({
    Key? key,
    this.heightOfSizeBox,
    this.child_of_BMI,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final heightOfSizeBox;
  final child_of_BMI;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SizedBox(
      height: media.height * heightOfSizeBox,
      width: double.infinity,
      child: child_of_BMI,
    );
  }
}
