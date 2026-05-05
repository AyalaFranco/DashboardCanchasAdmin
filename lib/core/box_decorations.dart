import 'package:flutter/material.dart';

class BoxDecorations {
  
  static BoxDecoration regularContainer(BuildContext context) => BoxDecoration(
   
    color: ColorScheme.of(context).onSecondary, 
    borderRadius: BorderRadius.circular(16),
  );
}
