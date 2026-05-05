import 'package:flutter/material.dart';

class AppTextStyles {

  static TextStyle title(BuildContext context) => 
      TextTheme.of(context).headlineMedium!.copyWith(
        fontWeight: FontWeight.bold
      );
     static TextStyle body(BuildContext context) =>
      TextTheme.of(context).bodyLarge!.copyWith(
        color: ColorScheme.of(context).onSurface,
      );

  static TextStyle label(BuildContext context) =>
      TextTheme.of(context).labelMedium!.copyWith(
        color: ColorScheme.of(context).primary,
      );
  static TextStyle bodySmall(BuildContext context) =>
    TextTheme.of(context).bodySmall!.copyWith(
      fontSize: 10,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic
    );
  // static TextStyle title =TextStyle(
  //   color: Colors.black,
  //   fontSize: 22,
  //   fontWeight: FontWeight.bold,
  // );
  // static const TextStyle bodyText = TextStyle(
  //   color: Colors.black,
  //   fontSize: 16,
  //   fontWeight: FontWeight.bold,
  // );
  // static const TextStyle secondaryText = TextStyle(
  //   color: Colors.grey,
  //   fontSize: 10,
  //   fontStyle: FontStyle.italic,
  // );
  // static const TextStyle terciaryText = TextStyle(
  //   color: Colors.grey,
  //   fontSize: 10,
  //   fontStyle: FontStyle.italic,
  // );
  // static const TextStyle backgroundText = TextStyle(
  //   color: Colors.yellow,
  //   fontSize: 16,
  //   fontWeight: FontWeight.bold,
  //   fontStyle: FontStyle.italic,
  // );
}
