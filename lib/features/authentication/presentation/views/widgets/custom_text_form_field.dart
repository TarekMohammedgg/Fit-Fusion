import 'package:fit_fusion/core/utils/app_styler.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      // validator: (value) {
      //   if (value == null || value.trim().isEmpty) {
      //     return "Please Enter value in the field";
      //   } else {
      //     return null;
      //   }
      // },
      decoration: InputDecoration(
        filled: true,
        enabledBorder: inputBorder(),
        fillColor: Color(0xff302938),

        focusedBorder: inputBorder(),
        hintText: hintText,
        hintStyle: AppStyle.styleRegular16,
      ),
    );
  }

  OutlineInputBorder inputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),

      borderRadius: BorderRadius.circular(10),
    );
  }
}
