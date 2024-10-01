import 'dart:ui'; // Import this for the blur effect
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../THEMES/BasicTheme.dart';
import 'Report/ConnectedNotSaleReport.dart';
import 'Report/ConnectedSaleReport.dart';
import 'Report/NotConnectedReport.dart';
import 'Report/UnabletoConnectReport.dart';

class BusinessReport extends StatefulWidget {
  const BusinessReport({super.key});

  @override
  State<BusinessReport> createState() => _BusinessReportState();
}

class _BusinessReportState extends State<BusinessReport> {
  final Map<String, int> leadCounts = {
    'Connected Sale': 25,
    'Connected Not Sale': 13,
    'Unable to Connect': 7,
    'Disconnect': 4,
  };

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text('Business Report'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Stack(
        children: [
          BackgroundImageContainer(context),

          SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ConnectedSaleDetails()));
                      },
                      child: buildStatusContainer(
                        'Connected - Sale',
                        Icons.check_circle_outline,
                        Colors.greenAccent.shade700,
                        leadCounts['Connected Sale'] ?? 0,
                        screenWidth,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04), // Responsive spacing
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ConnectedNotSaleDetails()));
                      },
                      child: buildStatusContainer(
                        'Connected - Not Sale',
                        Icons.error_outline,
                        Colors.blueAccent.shade700,
                        leadCounts['Connected Not Sale'] ?? 0,
                        screenWidth,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>UnableToConnectDetails()));
                      },
                      child: buildStatusContainer(
                        'Unable to Connect',
                        MdiIcons.wifiOff,
                        Colors.orangeAccent.shade700,
                        leadCounts['Unable to Connect'] ?? 0,
                        screenWidth,
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotConnectedDetails()));
                      },
                      child: buildStatusContainer(
                        'Not Connected',
                        Icons.power_settings_new,
                        Colors.redAccent.shade700,
                        leadCounts['Disconnect'] ?? 0,
                        screenWidth,
                      ),
                    ),
                  ],
                ),
              ),
          ),

        ],
      ),
    );
  }

  Widget buildStatusContainer(String title, IconData icon, Color color, int leadCount, double screenWidth) {
    return Container(
      height: screenWidth * 0.35, // Responsive height based on screen width
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color.withOpacity(0.8), color],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: screenWidth * 0.15, color: Colors.white), // Responsive icon size
            SizedBox(height: screenWidth * 0.02), // Responsive spacing
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.05, // Responsive font size
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
            SizedBox(height: screenWidth * 0.02), // Responsive spacing
            Text(
              '$leadCount Leads',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Responsive font size
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
