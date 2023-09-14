import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class RoundedButton extends StatefulWidget {
  Color? color;
  String text;
  Color textColor;
  double fontSize;
  double height;
  double width;
  var borderRadius;
  Color? borderColor;
  RoundedButton(
      {super.key,
      required this.fontSize,
      required this.text,
      required this.textColor,
      required this.height,
      required this.width,
      required this.borderRadius,
      this.borderColor,
      this.color});

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(
            width: 2,
            color: widget.borderColor!,
          ),
          borderRadius: BorderRadius.circular(widget.borderRadius)),
      child: Center(
        child: Text(
          widget.text,
          style: GoogleFonts.poppins(
              fontSize: widget.fontSize,
              color: widget.textColor,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
