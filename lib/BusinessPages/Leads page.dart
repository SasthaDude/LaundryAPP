//
// import 'package:flutter/material.dart';
//
// import '../THEMES/BasicTheme.dart';
//
// class Leadspage extends StatefulWidget {
//   const Leadspage({super.key});
//
//   @override
//   State<Leadspage> createState() => _LeadspageState();
// }
//
// class _LeadspageState extends State<Leadspage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "LAUND",
//           style: appName(context)?.copyWith(fontSize: 24, color: Colors.white),
//         ),
//         backgroundColor: Colors.teal.shade600,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Colors.teal.shade50, Colors.white],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Leads",
//                 style: TextStyle(
//                   fontSize: 36,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.teal.shade800,
//                   fontFamily: 'Roboto', // Custom font
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildServiceCard(
//                     context,
//                     title: "All Leads",
//                     imageUrl: "assets/business/All Leads.jpg",
//                   ),
//                   _buildServiceCard(
//                     context,
//                     title: "Today's Leads",
//                     imageUrl: "assets/business/Today's Leads.jpg",
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Text(
//                 "Service Leads",
//                 style: TextStyle(
//                   fontSize: 36,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.teal.shade800,
//                   fontFamily: 'Roboto', // Custom font
//                 ),
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildServiceCard(
//                     context,
//                     title: "Washing",
//                     imageUrl: "assets/business/washing.jpg",
//                   ),
//                   _buildServiceCard(
//                     context,
//                     title: "Drying",
//                     imageUrl: "assets/business/drying.jpg",
//                   ),
//                 ],
//               ),
//               SizedBox(height: 20),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildServiceCard(
//                     context,
//                     title: "Ironing",
//                     imageUrl: "assets/business/ironing.jpg",
//                   ),
//                   _buildServiceCard(
//                     context,
//                     title: "Other Service",
//                     imageUrl: "assets/business/more.jpg",
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildServiceCard(BuildContext context, {required String title, required String imageUrl}) {
//     return GestureDetector(
//       onTap: () {
//         // Handle tap event if needed
//       },
//       child: AnimatedContainer(
//         duration: Duration(milliseconds: 300),
//         height: 160,
//         width: 160,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 10,
//               offset: Offset(0, 6),
//             ),
//           ],
//         ),
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(15),
//           child: Stack(
//             fit: StackFit.expand,
//             children: [
//               Image.network(
//                 imageUrl,
//                 fit: BoxFit.cover,
//               ),
//               Container(
//                 color: Colors.black.withOpacity(0.3), // Semi-transparent overlay
//                 child: Align(
//                   alignment: Alignment.bottomCenter,
//                   child: Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 18,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
import 'dart:ui';

import 'package:flutter/material.dart';

class Leadspage extends StatefulWidget {
  const Leadspage({super.key});

  @override
  State<Leadspage> createState() => _LeadspageState();
}

class _LeadspageState extends State<Leadspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LAUND",
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: 'Arial', // Changed font
          ),
        ),
        backgroundColor: Colors.lightBlue.shade700,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade50, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Leads",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue.shade800,
                  fontFamily: 'Georgia', // Changed font
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildServiceCard(
                    context,
                    title: "All Leads",
                  ),
                  _buildServiceCard(
                    context,
                    title: "Today's Leads",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Service Leads",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue.shade800,
                  fontFamily: 'Georgia', // Changed font
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildServiceCard(
                    context,
                    title: "Washing",
                  ),
                  _buildServiceCard(
                    context,
                    title: "Drying",
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildServiceCard(
                    context,
                    title: "Ironing",
                  ),
                  _buildServiceCard(
                    context,
                    title: "Other Service",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, {required String title}) {
    return GestureDetector(
      onTap: () {
        // Handle tap event if needed
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: 160,
        width: 160,
        decoration: BoxDecoration(
          color: Colors.lightBlue.shade100.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.lightBlue.shade100.withOpacity(0.4),
                ),
              ),
              Center(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Verdana', // Changed font
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


