import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MyAnalysis extends StatefulWidget {
  @override
  State<MyAnalysis> createState() => _MyAnalysisState();
}

class _MyAnalysisState extends State<MyAnalysis> {
  bool myShowPieChart = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.black),
            ),
            Text(
              "My Analysis",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05, // Responsive font size
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  myShowPieChart = !myShowPieChart;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  myShowPieChart ? Icons.bar_chart : Icons.pie_chart,
                  color: Colors.red,
                  size: screenWidth * 0.08, // Responsive icon size
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: myShowPieChart
              ? Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02),
            child: Column(
              children: [
                // Pie Chart Container with gradient background
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade400, Colors.blue.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: SizedBox(
                    height: screenHeight * 0.25, // Responsive height
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PieChart(
                          PieChartData(
                            sections: myPieChartSections(),
                            borderData: FlBorderData(show: false),
                            centerSpaceRadius: 50,
                            sectionsSpace: 4,
                          ),
                        ),
                        // Total Spending in the Center with gradient text
                        Text(
                          "330",
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                // List of Categories with icons and progress bars
                Expanded(
                  child: ListView(
                    children: [
                      myPieBarChartItem(
                        icon: Icons.local_laundry_service,
                        label: "Washing",
                        iconBackgroundColor: Colors.greenAccent.shade700,
                        amount: 90,
                      ),
                      myPieBarChartItem(
                        icon: Icons.iron,
                        label: "Ironing",
                        iconBackgroundColor: Colors.orangeAccent.shade700,
                        amount: 120,
                      ),
                      myPieBarChartItem(
                        icon: Icons.checkroom,
                        label: "Dry Cleaning",
                        iconBackgroundColor: Colors.redAccent.shade700,
                        amount: 50,
                      ),
                      myPieBarChartItem(
                        icon: Icons.more_horiz,
                        label: "Other",
                        amount: 70,
                        iconBackgroundColor: Colors.grey.shade600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
              : Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.02),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade400, Colors.blue.shade200],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.04),
                    child: Container(
                      height: screenHeight * 0.3, // Responsive height
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceEvenly,
                          maxY: 150,
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                interval: 30,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.04,
                                      color: Colors.white,
                                    ),
                                  );
                                },
                              ),
                            ),
                            topTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: false,
                              ),
                            ),
                          ),
                          gridData: FlGridData(
                            show: false,
                          ),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(
                                  toY: 90,
                                  color: Colors.greenAccent.shade700,
                                  width: 24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 1,
                              barRods: [
                                BarChartRodData(
                                  toY: 120,
                                  color: Colors.orangeAccent.shade700,
                                  width: 24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(
                                  toY: 50,
                                  color: Colors.redAccent.shade700,
                                  width: 24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(
                                  toY: 70,
                                  color: Colors.grey.shade600,
                                  width: 24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Expanded(
                  child: ListView(
                    children: [
                      myPieBarChartItem(
                        icon: Icons.local_laundry_service,
                        label: 'Washing',
                        iconBackgroundColor: Colors.greenAccent.shade700,
                        amount: 90,
                      ),
                      myPieBarChartItem(
                        icon: Icons.iron,
                        label: 'Ironing',
                        iconBackgroundColor: Colors.orangeAccent.shade700,
                        amount: 120,
                      ),
                      myPieBarChartItem(
                        icon: Icons.checkroom,
                        label: 'Dry Cleaning',
                        iconBackgroundColor: Colors.redAccent.shade700,
                        amount: 50,
                      ),
                      myPieBarChartItem(
                        icon: Icons.more_horiz,
                        label: 'Others',
                        iconBackgroundColor: Colors.grey.shade600,
                        amount: 70,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  List<PieChartSectionData> myPieChartSections() {
    return [
      PieChartSectionData(
        color: Colors.greenAccent.shade700,
        value: 90,
        radius: 50,
        title: '90',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: Colors.orangeAccent.shade700,
        value: 120,
        radius: 50,
        title: '120',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: Colors.redAccent.shade700,
        value: 50,
        radius: 50,
        title: '50',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: Colors.grey.shade600,
        value: 70,
        radius: 50,
        title: '70',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
  }

  Widget myPieBarChartItem({
    required IconData icon,
    required String label,
    required double amount,
    required Color iconBackgroundColor,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      shadowColor: Colors.grey.withOpacity(0.3),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: iconBackgroundColor,
              ),
              padding: EdgeInsets.all(10),
              child: Icon(icon, size: 28, color: Colors.white),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    "${amount}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 18, color: Colors.black45),
          ],
        ),
      ),
    );
  }
}

