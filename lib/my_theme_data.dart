import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/app_colors.dart';


class MyThemeData {
  static final ThemeData lightMode =ThemeData(
    primaryColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30)
        )
      ),),

    

  textTheme:TextTheme(
    titleLarge: GoogleFonts.poppins(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.whiteColor
    ),
    titleMedium: GoogleFonts.poppins(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor
  ),
  titleSmall: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: AppColors.blackColor
  ),
  )

  );


}