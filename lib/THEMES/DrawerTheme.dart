// import 'package:flutter/material.dart';
//
//
// TextStyle DrawerOption = TextStyle(
//   color: Colors.black,
//   fontSize: 10,
// );
//
// //-------------Profile Section-----------------
//
// TextStyle ProfileHeading = TextStyle(
//   color: Colors.blue,
//   fontSize: 30,
//   fontWeight: FontWeight.bold,
// );
//
// TextStyle FieldHeadingProfile = TextStyle(
//   color: Colors.black,
//   fontSize: 20,
//   fontWeight: FontWeight.bold
// );
//
// TextStyle FieldProfile = TextStyle(
//   color: Colors.black,
//   fontSize: 16,
//   fontStyle: FontStyle.italic
// );
//
//
//
// //-------------Settings Section---------------------
//
// TextStyle SettingsOptions = TextStyle(
//   color: Colors.black,
//   fontSize: 20,
//   fontStyle: FontStyle.italic,
// );


import 'package:flutter/material.dart';

// Function to calculate responsive font size
double responsiveFontSize(BuildContext context, double size) {
  return size * MediaQuery.of(context).size.width / 375; // 375 is a reference width (iPhone 8 width)
}

//-------------Drawer Section-----------------
TextStyle drawerOption(BuildContext context) {
  return TextStyle(
    color: Colors.black,
    fontSize: responsiveFontSize(context, 15),
  );
}

//-------------Profile Section-----------------

TextStyle profileHeading(BuildContext context) {
  return TextStyle(
    color: Colors.blue,
    fontSize: responsiveFontSize(context, 30),
    fontWeight: FontWeight.bold,
  );
}

TextStyle fieldHeadingProfile(BuildContext context) {
  return TextStyle(
    color: Colors.black,
    fontSize: responsiveFontSize(context, 20),
    fontWeight: FontWeight.bold,
  );
}

TextStyle fieldProfile(BuildContext context) {
  return TextStyle(
    color: Colors.black,
    fontSize: responsiveFontSize(context, 16),
    fontStyle: FontStyle.italic,
  );
}

//-------------Settings Section---------------------

TextStyle settingsOptions(BuildContext context) {
  return TextStyle(
    color: Colors.black,
    fontSize: responsiveFontSize(context, 20),
    fontStyle: FontStyle.italic,
  );
}
