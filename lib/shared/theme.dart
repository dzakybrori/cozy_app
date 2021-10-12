import 'package:cozy_app/shared/shared_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Color(0XFF5843BE);
Color secondaryColor = Color(0XFFFF9376);
Color lightBackgroundColor = Color(0XFFFEFEFE);
Color errorColor = Color(0XFFFF5B5B);
Color surfaceColor = Color(0XFFF0F0F0);
Color greySubTextColor = Color(0XFF7A7E86);
Color lightGreySubTextColor = Color(0XFF82868E);

MaterialColor primarySwatch = generateMaterialColor(primaryColor);
MaterialColor secondarySwatch = generateMaterialColor(secondaryColor);

TextStyle regulerTextStyle = GoogleFonts.poppins(
  fontSize: 16.sp,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);

TextStyle titleTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: Colors.black,
);

TextStyle subTitleTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w300,
);

TextStyle btnTextStyle = GoogleFonts.poppins(
  fontSize: 18.sp,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

TextStyle accentTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: primaryColor,
);
