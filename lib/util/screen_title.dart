import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ScreenTitle extends StatelessWidget {
  final String title;
  const ScreenTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.akshar(
         textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      )
    );
  }
}

