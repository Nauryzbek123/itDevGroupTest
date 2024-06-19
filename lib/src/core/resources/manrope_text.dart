import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManropeText extends StatelessWidget {
  final double val;
  final String text;
  final Color color;
  final FontWeight fontWeight;

  const ManropeText(this.text, this.val, this.color,this.fontWeight,  {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.manrope(
          color: color, fontSize: val, fontWeight: fontWeight),
    );
  }
}