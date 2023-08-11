import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.iconData});
  TextEditingController controller;
  String? hintText;
  Icon iconData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(top: 20, bottom: 0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          )),
          prefixIcon: iconData,
          hintText: hintText,
          hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5),
        ),
      ),
    );
  }
}
