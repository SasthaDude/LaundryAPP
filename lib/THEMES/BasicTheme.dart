import 'dart:ui';

import 'package:flutter/material.dart';

double responsiveFontSize(BuildContext context, double baseSize) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;

  double screenSize = screenWidth < screenHeight ? screenWidth : screenHeight;

  // Adjust the baseSize according to screen size
  return baseSize * screenSize / 375; // 375 is a reference size (like an iPhone 8 width or height)
}

// Responsive TextStyle for APPNAME
TextStyle appName(BuildContext context) {
  return TextStyle(
      color: Colors.blueAccent,
    fontSize: responsiveFontSize(context, 24),
    fontWeight: FontWeight.bold,
  );
}



Container BackgroundImageContainer(BuildContext context){
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/AppBackgroundImage.jpeg'),
        fit: BoxFit.cover,
      ),
    ),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        color: Colors.blue.withOpacity(0.3),
      ),
    ),
  );

}