import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatefulWidget {
  PasswordFieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.iconprefix,
  });
  TextEditingController controller;
  String? hintText;
  Icon iconprefix;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ).copyWith(top: 20, bottom: 0),
      child: TextField(
        controller: widget.controller,
        obscureText: isObsecure,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 14),
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isObsecure = !isObsecure;
                  });
                },
                icon: isObsecure
                    ? Icon(
                        Icons.visibility_off,
                        color: Colors.grey.shade700,
                      )
                    : Icon(
                        Icons.visibility,
                        color: Colors.blue.shade800,
                      )),
          ),
          prefixIcon: widget.iconprefix,
          hintText: widget.hintText,
          hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.5),
        ),
      ),
    );
  }
}
