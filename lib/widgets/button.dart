import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatefulWidget {
  ButtonWidget({super.key, required this.buttonText, required this.onTap});
  String buttonText;
  void Function()? onTap;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          alignment: Alignment.center,
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.deepPurple.withOpacity(0.20),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.50),
                blurRadius: 8.0,
                spreadRadius: 3.0,
                offset: const Offset(
                  4.0,
                  4.0,
                ),
              )
            ],
          ),
          child: Text(
            widget.buttonText,
            style: GoogleFonts.josefinSans(
                fontSize: 30,
                color: Colors.deepPurple,
                fontWeight: FontWeight.w800),
          ),
        ),
      ),
    );
  }
}
