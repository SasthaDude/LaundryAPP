import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'EnteringPages/Welcome/WELCOME.dart';
import 'Provider/Provider.dart';
import 'TRIAL/aaa.dart';

void main() {
  runApp(MyApp());
}

class LeadDashboardProvider extends ChangeNotifier {
  // Simulate real-time data updates with a timer
  final StreamController<int> _leadsStreamController = StreamController<int>();
  Stream<int> get leadsStream => _leadsStreamController.stream;

  LeadDashboardProvider() {
    Timer.periodic(Duration(seconds: 5), (timer) {
      _leadsStreamController.add((timer.tick * 10) % 150);
    });
  }

  @override
  void dispose() {
    _leadsStreamController.close();
    super.dispose();
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => AppDataProvider(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home:Welcome()),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppDataProvider(), // Provide the AppDataProvider instance
      child: Consumer<AppDataProvider>(
        builder: (context, appDataProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Laundry App',
            theme: ThemeData.light(), // Define your light theme here
            darkTheme: ThemeData.dark(), // Define your dark theme here
            themeMode: appDataProvider.themeMode, // Apply the theme based on the current mode
            home: Welcome(), // Replace with your home screen widget
          );
        },
      ),
    );
  }
}
