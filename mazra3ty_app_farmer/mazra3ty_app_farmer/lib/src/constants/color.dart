// This me 
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class TColors{
  TColors._(); // this basically makes it so you can instantiate this class

  // App Basic Colors
  static const Color primary = Color(0xFF4b68ff);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);
  // Gradients Colors
  static const Gradient linearGradient = LinearGradient(
    begin: Alignment(0.0, 0.0),
    end: Alignment(0.707,-0.707),
    colors: [
      Color(0xffff9a9a),
      Color(0xfffad0c4),
      Color(0xfffad0c4),
    ]
    
  ); 
  // Text Colors
  static const Color textPrimary = Color(0xFF333333);
  static const Color textSecondary = Color(0xFF6C7570);
  static const Color textWhite = Colors.white;
  // Background Colors
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);
  // Background Container Colors
  static const Color lightContainer = Color(0xFFFFFFFF);
  static const Color darkContainer = Color(0xFF4F4F4F);
  // Button Colors
  static const Color buttonPrimary = Color(0xFF4b68ff);
  static const Color buttonSecondary = Color(0xFF6C7570);
  static const Color buttonDisabled = Color(0xFFC4C4C4);
  // Border Colors
  static const Color borderPrimary = Color(0xFFD9D9D9);
  static const Color borderSecondary = Color(0xFFE5E5E5);
  // Error and Validations Colors
  static const Color error = Color(0xFFD32F2F);
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF2196F3);
  // Neutral Colors
  static const Color black = Color(0xFF232323);
  static const Color white = Color(0xFFFFFFFF);
  static const Color darkGrey = Color(0xFF4F4F4F);
  static const Color softGrey = Color(0xFF828282);
  static const Color lightGrey = Color(0xFFE0E0E0);
  



}
