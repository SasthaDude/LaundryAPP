// import 'dart:ui';
//
// import 'package:flutter/material.dart';
// import 'Analysis/MyAnalysis.dart';
// import 'Analysis/OverallAnalysis.dart';
// import 'Analysis/ReportAnalysis.dart';
//
// class BusinessAnalysis extends StatefulWidget {
//   @override
//   _BusinessAnalysisState createState() => _BusinessAnalysisState();
// }
//
// class _BusinessAnalysisState extends State<BusinessAnalysis> {
//   int _selectedIndex = 0;
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   final List Pages = [
//     OverallAnalysis(),
//     MyAnalysis(),
//     ReportAnalysis(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Body content for the selected page
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/backgroundPicture.jpeg'), // Add the path to your image here
//                 fit: BoxFit.cover,
//               ),
//             ),
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//               child: Container(
//                 color: Colors.black.withOpacity(0.4),
//               ),
//             ),
//           ),
//           Pages[_selectedIndex],
//           // BottomNavigationBar floating over the body content
//           Positioned(
//             bottom: 20,
//             left: 16,
//             right: 16,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black26,
//                     blurRadius: 10,
//                     spreadRadius: 2,
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   _buildBarItem(Icons.dashboard, "Overall", 0),
//                   _buildBarItem(Icons.person, "My", 1),
//                   _buildBarItem(Icons.insert_chart, "Report", 2),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//   Widget _buildBarItem(IconData icon, String label, int index) {
//     bool isSelected = _selectedIndex == index;
//
//     return GestureDetector(
//       onTap: () => _onItemTapped(index),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0), // Adjust padding for better layout
//         child: Column(
//           children: [
//             // Animated container for icon with background glow effect
//             AnimatedContainer(
//               duration: Duration(milliseconds: 300),
//               height: 50,
//               width: isSelected ? 70 : 50, // Smooth transition on selection
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(25), // More rounded shape
//                 gradient: isSelected
//                     ? LinearGradient(
//                   colors: [Colors.blueAccent, Colors.cyanAccent],
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                 )
//                     : null, // Gradient on selected state
//                 color: isSelected ? null : Colors.transparent, // Transparent when not selected
//                 boxShadow: isSelected
//                     ? [
//                   BoxShadow(
//                     color: Colors.blueAccent.withOpacity(0.4), // Light shadow for selected item
//                     blurRadius: 10,
//                     spreadRadius: 1,
//                     offset: Offset(0, 4), // Creates a subtle elevation effect
//                   ),
//                 ]
//                     : [],
//               ),
//               child: Center(
//                 child: Icon(
//                   icon,
//                   color: isSelected ? Colors.white : Colors.grey[600], // Different colors when selected
//                   size: isSelected ? 35 : 28, // Smooth size transition
//                 ),
//               ),
//             ),
//             SizedBox(height: 6), // Added space between icon and text for better spacing
//             Text(
//               label,
//               style: TextStyle(
//                 color: isSelected ? Colors.blueAccent : Colors.grey[600], // Label color transition
//                 fontSize: isSelected ? 16 : 14, // Smooth font size transition
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Bold when selected
//                 letterSpacing: 0.5, // Slight letter spacing for readability
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
// }



import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../THEMES/BasicTheme.dart';
import 'Analysis/MyAnalysis.dart';
import 'Analysis/OverallAnalysis.dart';
import 'Analysis/ReportAnalysis.dart';

class BusinessAnalysis extends StatefulWidget {
  @override
  _BusinessAnalysisState createState() => _BusinessAnalysisState();
}

class _BusinessAnalysisState extends State<BusinessAnalysis> {


  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> Pages = [
    OverallAnalysis(),
    MyAnalysis(),
    ReportAnalysis(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          BackgroundImageContainer(context),
          Pages[_selectedIndex],
          Positioned(
            bottom: screenHeight * 0.05,
            left: screenWidth * 0.04,
            right: screenWidth * 0.04,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildBarItem(Icons.dashboard, "Overall", 0, screenWidth),
                  _buildBarItem(Icons.person, "My", 1, screenWidth),
                  _buildBarItem(Icons.insert_chart, "Report", 2, screenWidth),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarItem(IconData icon, String label, int index, double screenWidth) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.02,
          vertical: screenWidth * 0.01,
        ),
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: screenWidth * 0.1, // Adjust height based on screen width
              width: isSelected ? screenWidth * 0.18 : screenWidth * 0.13, // Responsive width
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: isSelected
                    ? LinearGradient(
                  colors: [Colors.blueAccent, Colors.cyanAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
                    : null,
                color: isSelected ? null : Colors.transparent,
                boxShadow: isSelected
                    ? [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.4),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: Offset(0, 4),
                  ),
                ]
                    : [],
              ),
              child: Center(
                child: Icon(
                  icon,
                  color: isSelected ? Colors.white : Colors.grey[600],
                  size: isSelected ? screenWidth * 0.08 : screenWidth * 0.06, // Responsive size
                ),
              ),
            ),
            SizedBox(height: 6),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blueAccent : Colors.grey[600],
                fontSize: isSelected ? screenWidth * 0.04 : screenWidth * 0.035, // Responsive font size
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
