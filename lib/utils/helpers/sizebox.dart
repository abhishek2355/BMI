import 'package:flutter/cupertino.dart';

class SizeBoxApp extends StatelessWidget {
  const SizeBoxApp({
    Key? key,
    this.heightOfSizeBox,
  }) : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final heightOfSizeBox;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heightOfSizeBox,
    );
  }
}
