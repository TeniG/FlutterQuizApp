import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StyledText extends StatelessWidget {
  const StyledText(
      {super.key,
      required this.text,
      required this.size,
      this.alignment = TextAlign.center,
      this.color = Colors.white});
  final String text;
  final double size;
  final TextAlign alignment;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.roboto(
          fontSize: size,
          color: color,
          fontWeight: FontWeight.bold,
        ),
        textAlign: alignment);
  }
}
