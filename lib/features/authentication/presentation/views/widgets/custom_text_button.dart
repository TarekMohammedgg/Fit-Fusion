import 'package:flutter/material.dart';
// import 'package:resturant_app/core/utils/app_style.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, required this.widgt});
  final Function()? onPressed;
  // final String text;
  final Widget widgt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: AspectRatio(
        aspectRatio: 6.5,
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xff8021DE),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(child: widgt),
        ),
      ),
    );
  }
}
