import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utility/colors.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  const CommonTextWidget(
      {Key? key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w600,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Text(
        text,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
              fontSize: fontSize,
              color: BrandColors.text,
              fontWeight: fontWeight,
              fontFamily: 'poppins'),
        ),
      ),
    );
  }
}
