import 'package:chat_gpt/config/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final ThemeData light = ThemeData.light().copyWith(
    inputDecorationTheme: commonTheme.inputDecorationTheme,
    scaffoldBackgroundColor: AppConstants.bgColor,
    primaryColor: AppConstants.primaryColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppConstants.primaryColor,
      secondary: AppConstants.errorColor,
      error: AppConstants.errorColor,
    ),
    buttonTheme: const ButtonThemeData(
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      buttonColor: AppConstants.primaryColor,
      textTheme: ButtonTextTheme.normal,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppConstants.bgColor,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: AppConstants.bgColor,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),
    checkboxTheme: commonTheme.checkboxTheme,
    textTheme: commonTheme.textTheme,
    shadowColor: AppConstants.darkColor,
    cardColor: Colors.white,
    cardTheme: commonTheme.cardTheme,
  );

  static final ThemeData dark = ThemeData.dark().copyWith(
    inputDecorationTheme: commonTheme.inputDecorationTheme.copyWith(
      fillColor: AppConstants.darkColor,
      hintStyle: TextStyle(
        color: AppConstants.darkColor.withOpacity(0.4),
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      buttonColor: AppConstants.primaryColor,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: AppConstants.bgColor,
    primaryColor: AppConstants.primaryColor,
    cardColor: AppConstants.darkColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppConstants.primaryColor,
      secondary: AppConstants.darkColor,
      error: AppConstants.errorColor,
    ),
    shadowColor: Colors.transparent,
    checkboxTheme: commonTheme.checkboxTheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppConstants.bgColor,
      iconTheme: IconThemeData(color: Colors.white),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: AppConstants.bgColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    ),
    textTheme: commonTheme.textTheme,
    cardTheme: commonTheme.cardTheme,
  );

  static final ThemeData commonTheme = ThemeData(
    cardTheme: const CardTheme(
      shadowColor: AppConstants.darkColor,
      elevation: 8,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(22),
      fillColor: Colors.white,
      filled: true,
      suffixIconColor: AppConstants.errorColor,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: AppConstants.errorColor, width: 1),
      ),
    ),
    textTheme: ThemeData().textTheme.copyWith(
          headlineLarge: ThemeData().textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.w900,
                fontFamily: 'Raleway',
              ),
          headlineMedium: ThemeData().textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w900,
                fontFamily: 'Raleway',
              ),
          headlineSmall: ThemeData().textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w700,
                fontFamily: 'Raleway',
              ),
          titleLarge: ThemeData().textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: 'Raleway',
              ),
          titleMedium: ThemeData().textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                fontFamily: 'Raleway',
              ),
          titleSmall: ThemeData().textTheme.titleSmall!.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: 'Raleway',
              ),
          bodyLarge: ThemeData().textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w400,
                fontFamily: 'Raleway',
              ),
          labelSmall: ThemeData().textTheme.labelSmall!.copyWith(
                fontSize: 11,
                fontWeight: FontWeight.w200,
                fontFamily: 'Raleway',
              ),
        ),
    useMaterial3: true,
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all<Color>(const Color(0xFFF3F4FD)),
      checkColor: MaterialStateProperty.all<Color>(const Color(0xFF14D49B)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      side: const BorderSide(width: 15, color: Color(0xFFF3F4FD)),
    ),
  );
}
