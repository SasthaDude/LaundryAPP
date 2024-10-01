import 'dart:ui';

import 'package:flutter/material.dart';
import '../THEMES/BasicTheme.dart';
import 'Leads/AllLeadsPage.dart';
import 'Leads/DryCleaningLeadsPage.dart';
import 'Leads/IroningLeadsPage.dart';
import 'Leads/OtherLeadsPage.dart';
import 'Leads/TodayLeadsPage.dart';
import 'Leads/WashingLeadsPage.dart';

class BusinessLeads extends StatefulWidget {
  const BusinessLeads({super.key});

  @override
  State<BusinessLeads> createState() => _BusinessLeadsState();
}

class _BusinessLeadsState extends State<BusinessLeads> {


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Business Leads'),
        backgroundColor: Colors.blueAccent.shade400.withOpacity(0.6),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          BackgroundImageContainer(context),

          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(screenWidth * 0.04), // Responsive padding
              child: Column(
                children: [
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AllLeadsDetails()));
                      },
                      child: buildLeadCard('All Leads', screenWidth, 'assets/AllLeads.jpeg')),
                  SizedBox(height: screenWidth * 0.04), // Responsive spacing
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>TodayLeadsDetails()));
                      },
                      child: buildLeadCard('Today\'s Leads', screenWidth, 'assets/todayleads.jpeg')),
                  SizedBox(height: screenWidth * 0.04),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>WashingLeadsDetails()));
                      },
                      child: buildLeadCard('Washing',  screenWidth, 'assets/washingg.jpeg')),
                  SizedBox(height: screenWidth * 0.04),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DryCleaningLeadsDetails()));
                      },
                      child: buildLeadCard('Dry Clean', screenWidth, 'assets/dryclean.jpeg')),
                  SizedBox(height: screenWidth * 0.04),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>IroningLeadsDetails()));
                      },
                      child: buildLeadCard('Ironing', screenWidth, 'assets/ironing.jpeg')),
                  SizedBox(height: screenWidth * 0.04),
                  GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>OtherLeadsDetails()));
                      },
                      child: buildLeadCard('Others',  screenWidth, 'assets/otherLaundry.jpeg')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLeadCard(String title, double screenWidth, String assetImage) {
    return Container(
      height: screenWidth * 0.5, // Responsive height based on screen width
      width: double.infinity, // Take full width of the parent
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Changes position of shadow
          ),
        ],
        image: DecorationImage(
          image: AssetImage(assetImage), // Set the asset image as background
          fit: BoxFit.fill, // Cover the entire container
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
        crossAxisAlignment: CrossAxisAlignment.center, // Center the content horizontally
        children: [
          Expanded(
            child: Container(), // This will create space for the image
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: screenWidth * 0.05, // Responsive font size
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10), // Optional spacing between text and the bottom
        ],
      ),
    );
  }

}
