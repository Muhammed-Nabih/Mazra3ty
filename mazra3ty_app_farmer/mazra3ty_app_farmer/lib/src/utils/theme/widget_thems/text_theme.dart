import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class TTextTheme {
  static  TextTheme lightTextTheme = TextTheme(
    displayLarge: GoogleFonts.oswald(
      color: Colors.black87,
      fontSize: 40,
    ),
    displayMedium: GoogleFonts.oswald(
        color:Colors.lightBlue,
        fontSize: 48,

    ),
    displaySmall: GoogleFonts.montserrat(
      color: Colors.black87,
      fontSize: 35,
    ),

    bodyLarge:GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 15,
    ),
    bodyMedium:GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: 17,
    ),



  );
  static  TextTheme darkTextTheme= TextTheme(
    displayLarge: GoogleFonts.oswald(
      color: Colors.white70,
      fontSize: 40,
    ),
    displayMedium: GoogleFonts.oswald(
      color: Colors.lightBlue,
      fontSize: 48,
    ),
    displaySmall: GoogleFonts.poppins(
      color: Colors.white70,
      fontSize: 35,
    ),
    bodyLarge: GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 14,
    ),
    bodyMedium:GoogleFonts.poppins(
      color: Colors.white60,
      fontSize: 17,
    ),



  );


}