import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../Provider/Provider.dart';

// class ThemeNotifier extends ChangeNotifier {
//   ThemeMode _themeMode = ThemeMode.light; // Default to Light Mode
//
//   ThemeMode get themeMode => _themeMode;
//
//   void setTheme(ThemeMode mode) {
//     _themeMode = mode;
//     notifyListeners();
//   }
// }

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _selectedTheme = 0;
  String _selectedLanguage = "English";// Default to Light Mode (0 = Light, 1 = Dark, 2 = System Default)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF97DCE0),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:25,top: 10 ),
            child: GestureDetector(
              onTap: () {
                _showThemeDialog(context);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(EvaIcons.colorPalette,),
                  ),
                  Text(
                    'Themes',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_active),
                ),
                Text('Notification',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 10),
            child: GestureDetector(
              onTap: () {
                _showLanguageDialog(context);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FaIcon(FontAwesomeIcons.language),
                  ),
                  Text(
                    'Change Language',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25,top: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.delete),
                ),
                Text('Delete Account',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showThemeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              SizedBox(width: 8),
              Text(
                'Theme setting',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<int>(
                title: Row(
                  children: [
                    Icon(Icons.wb_sunny, color: Colors.yellow),
                    SizedBox(width: 8),
                    Text('Light', style: TextStyle(color: Colors.white)),
                  ],
                ),
                value: 0,
                groupValue: _selectedTheme,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value!;
                  });
                },
                activeColor: Colors.green,
              ),
              RadioListTile<int>(
                title: Row(
                  children: [
                    Icon(Icons.nights_stay, color: Colors.white),
                    SizedBox(width: 8),
                    Text('Dark', style: TextStyle(color: Colors.white)),
                  ],
                ),
                value: 1,
                groupValue: _selectedTheme,
                onChanged: (value) {
                  setState(() {
                    _selectedTheme = value!;
                  });
                },
                activeColor: Colors.green,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel', style: TextStyle(color: Colors.white)),
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context, listen: false);
            //     if (_selectedTheme == 0) {
            //       themeNotifier.setTheme(ThemeMode.light);
            //     } else if (_selectedTheme == 1) {
            //       themeNotifier.setTheme(ThemeMode.dark);
            //     }
            //     Navigator.of(context).pop();
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.white,
            //     padding: EdgeInsets.symmetric(horizontal: 20),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   child: Text(
            //     'APPLY',
            //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            //   ),
            // ),
            ElevatedButton(
              onPressed: () {
                // Access the AppDataProvider using Provider
                AppDataProvider appDataProvider = Provider.of<AppDataProvider>(context, listen: false);

                // Check the selected theme and update it using the AppDataProvider
                if (_selectedTheme == 0) {
                  appDataProvider.setTheme(ThemeMode.light);
                } else if (_selectedTheme == 1) {
                  appDataProvider.setTheme(ThemeMode.dark);
                }

                // Close the dialog or navigate back
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'APPLY',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
            )

          ],
        );
      },
    );
  }
  void _showLanguageDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select Language',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 10),
              Divider(color: Colors.grey),
              Expanded(
                child: ListView(
                  children: [
                    _buildLanguageOption(context, 'English'),
                    _buildLanguageOption(context, 'Spanish'),
                    _buildLanguageOption(context, 'French'),
                    _buildLanguageOption(context, 'German'),
                    _buildLanguageOption(context, 'Chinese'),
                    // Add more languages here...
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  Widget _buildLanguageOption(BuildContext context, String language) {
    return ListTile(
      leading: _selectedLanguage == language
          ? Icon(Icons.check_circle, color: Colors.green)
          : Icon(Icons.circle_outlined, color: Colors.white),
      title: Text(
        language,
        style: TextStyle(color: Colors.white),
      ),
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        Navigator.of(context).pop();
      },
    );
  }
}


