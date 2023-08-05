import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  scaffoldBackgroundColor: Color(0xff281436),
  appBarTheme: appBarTheme,
  inputDecorationTheme: inputDecorationTheme,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: outlinedButtonStyle,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: elevatedButtonStyle,
  ),
  snackBarTheme: snackBarTheme,
  textTheme: TextTheme(
    bodyMedium: bubbleText,
  ),
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: Colors.transparent,
    elevation: 0,

  )
);

class Values {
  static double radius = 30;
}

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  hintStyle: TextStyle(color: Colors.grey[300]),
  filled: true,
  fillColor: Color(0xff120818),
  prefixIconColor: Color(0xff281436),
  iconColor: Color(0xff281436),
  suffixIconColor: Color(0xff281436),
  hoverColor: Colors.red,
  contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 10,),

  // Borders **************************************************************
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Values.radius),
      borderSide: BorderSide.none),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Values.radius),
      borderSide: BorderSide.none),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Values.radius),
      borderSide: BorderSide.none),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Values.radius),
      borderSide: BorderSide.none),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Values.radius),
      borderSide: BorderSide.none),
  disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(Values.radius),
      borderSide: BorderSide.none),
);

AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: Color(0xff281436),
  foregroundColor: Colors.white,
  elevation: 0,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Color(0xff281436),
    systemNavigationBarColor: Color(0xff281436),
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.light,
  ),
  iconTheme: IconThemeData(
    color: Colors.white,
  ),
);

ButtonStyle outlinedButtonStyle = OutlinedButton.styleFrom(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
  side: BorderSide(
    width: 2,
    color: Color(0xffFA6450),
  ),
  primary: Color(0xffFA6450),
  textStyle: TextStyle(
    color: Color(0xffFA6450),
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
  padding: EdgeInsets.symmetric(
    horizontal: 40,
    vertical: 10,
  ),
  elevation: 0,
);


ButtonStyle elevatedButtonStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.symmetric(
    horizontal: 100,
    vertical: 10,
  ),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(50),
  ),
  primary: Colors.white,
  onPrimary: Colors.white,
  textStyle: TextStyle(
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
  backgroundColor: Color(0xffFAB400),
  elevation: 0,
);


SnackBarThemeData snackBarTheme = SnackBarThemeData(
  backgroundColor: Color(0xff120818),
  actionTextColor: Color(0xffFAB400),
  behavior: SnackBarBehavior.floating,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
);

TextStyle bubbleText = TextStyle(
  color: Colors.white,
  fontSize: 18.sp,
);