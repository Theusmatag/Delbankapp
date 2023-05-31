import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

ThemeData get ligththeme => ThemeData(
      primaryColor: _lightColorScheme.onSecondary,
      iconTheme: IconThemeData(color: _lightColorScheme.onSecondary),
      fontFamily: 'Century Gothic',
      textTheme: TextTheme(
        titleLarge: TextStyle(color: _lightColorScheme.onSecondary),
        titleMedium: TextStyle(color: _lightColorScheme.onSecondary),
        titleSmall: TextStyle(color: _lightColorScheme.onSecondary),
        bodyLarge: TextStyle(color: _lightColorScheme.onSecondary),
        bodyMedium: TextStyle(color: _lightColorScheme.onSecondary),
        bodySmall: TextStyle(color: _lightColorScheme.onSecondary),
        headlineLarge: TextStyle(color: _lightColorScheme.onSecondary),
        headlineMedium: TextStyle(color: _lightColorScheme.onSecondary),
        headlineSmall: TextStyle(color: _lightColorScheme.onSecondary),
      ),
      scaffoldBackgroundColor: _lightColorScheme.primary,
      cardTheme: CardTheme(
        surfaceTintColor: _lightColorScheme.primary,
        color: _lightColorScheme.primary,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          textStyle: TextStyle(color: _lightColorScheme.onSecondary),
          side: BorderSide(width: 1, color: _darkColorScheme.primary),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            surfaceTintColor:
                const MaterialStatePropertyAll(Colors.transparent),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (states) => _lightColorScheme.onSecondary),
            shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.all(Radius.elliptical(10, 10))))),
      ),
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
          surfaceTintColor: const Color.fromARGB(255, 255, 255, 255),
          elevation: 8,
          titleTextStyle: TextStyle(color: _lightColorScheme.onSecondary),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          foregroundColor: _lightColorScheme.onSecondary),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: 0,
        backgroundColor: _lightColorScheme.onSecondary,
      ),
    );
// -*******************************************************************************************************************************************************-
ThemeData get darktheme => ThemeData(
    primaryColor: _darkColorScheme.primary,
    iconTheme: IconThemeData(color: _darkColorScheme.secondary),
    fontFamily: 'Century Gothic',
    textTheme: TextTheme(
      titleLarge: TextStyle(color: _darkColorScheme.secondary),
      titleMedium: TextStyle(color: _darkColorScheme.secondary),
      titleSmall: TextStyle(color: _darkColorScheme.secondary),
      bodyLarge: TextStyle(color: _darkColorScheme.secondary),
      bodyMedium: TextStyle(color: _darkColorScheme.primary),
      bodySmall: TextStyle(color: _darkColorScheme.outline, fontSize: 14),
    ),
    scaffoldBackgroundColor: _darkColorScheme.primary,
    cardTheme: CardTheme(color: _darkColorScheme.primary),
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(color: _darkColorScheme.secondary),
      centerTitle: true,
      backgroundColor: _darkColorScheme.onPrimary,
    ),
    inputDecorationTheme: InputDecorationTheme(
      suffixIconColor: _darkColorScheme.primary,
      prefixIconColor: _darkColorScheme.primary,
      iconColor: _darkColorScheme.primary,
      labelStyle: TextStyle(color: _darkColorScheme.primary, fontSize: 12),
      border: const OutlineInputBorder(),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkColorScheme.primary)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _darkColorScheme.primary)),
      floatingLabelStyle: TextStyle(
        color: _darkColorScheme.primary,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(width: 1, color: _darkColorScheme.primary),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          iconColor: MaterialStateProperty.resolveWith<Color>(
              (states) => _darkColorScheme.secondary),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (states) => _darkColorScheme.primary),
          shape: const MaterialStatePropertyAll<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.elliptical(10, 10))))),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      elevation: 7,
      backgroundColor: _darkColorScheme.primary,
    ),
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: _darkColorScheme.onPrimary,
        surfaceTintColor: Colors.white));
