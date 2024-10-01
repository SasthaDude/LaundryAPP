import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OverallAnalysis extends StatefulWidget {
  @override
  State<OverallAnalysis> createState() => _OverallAnalysisState();
}

class _OverallAnalysisState extends State<OverallAnalysis> {
  bool overallShowPieChart = true;

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
              "Overall Analysis",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  overallShowPieChart = !overallShowPieChart;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  overallShowPieChart ? Icons.bar_chart : Icons.pie_chart,
                  color: Colors.red,
                  size: screenWidth * 0.08,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: overallShowPieChart
              ? Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.04,
              vertical: screenHeight * 0.02,
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
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
                            sections: overallPieChartSections(),
                            borderData: FlBorderData(show: false),
                            centerSpaceRadius: 50,
                            sectionsSpace: 4,
                          ),
                        ),
                        Text(
                          "960",
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
                Expanded(
                  child: ListView(
                    children: [
                      overallPieBarChartItem(
                        icon: Icons.local_laundry_service,
                        label: "Washing",
                        iconBackgroundColor: Colors.greenAccent.shade700,
                        amount: 170,
                      ),
                      overallPieBarChartItem(
                        icon: Icons.iron,
                        label: "Ironing",
                        iconBackgroundColor: Colors.orangeAccent.shade700,
                        amount: 302,
                      ),
                      overallPieBarChartItem(
                        icon: Icons.checkroom,
                        label: "Dry Cleaning",
                        iconBackgroundColor: Colors.redAccent.shade700,
                        amount: 106,
                      ),
                      overallPieBarChartItem(
                        icon: Icons.more_horiz,
                        label: "Other",
                        amount: 260,
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
              vertical: screenHeight * 0.02,
            ),
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
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      height: screenHeight * 0.3, // Responsive height
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceEvenly,
                          maxY: 350,
                          titlesData: FlTitlesData(
                            show: true,
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            leftTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                interval: 70,
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
                              sideTitles: SideTitles(showTitles: false),
                            ),
                            rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false),
                            ),
                          ),
                          gridData: FlGridData(show: false),
                          borderData: FlBorderData(show: false),
                          barGroups: [
                            BarChartGroupData(
                              x: 0,
                              barRods: [
                                BarChartRodData(
                                  toY: 170,
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
                                  toY: 302,
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
                                  toY: 106,
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
                                  toY: 260,
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
                      overallPieBarChartItem(
                        icon: Icons.local_laundry_service,
                        label: 'Washing',
                        iconBackgroundColor: Colors.greenAccent.shade700,
                        amount: 170,
                      ),
                      overallPieBarChartItem(
                        icon: Icons.iron,
                        label: 'Ironing',
                        iconBackgroundColor: Colors.orangeAccent.shade700,
                        amount: 302,
                      ),
                      overallPieBarChartItem(
                        icon: Icons.checkroom,
                        label: 'Dry Cleaning',
                        iconBackgroundColor: Colors.redAccent.shade700,
                        amount: 106,
                      ),
                      overallPieBarChartItem(
                        icon: Icons.more_horiz,
                        label: 'Others',
                        iconBackgroundColor: Colors.grey.shade600,
                        amount: 260,
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

  List<PieChartSectionData> overallPieChartSections() {
    return [
      PieChartSectionData(
        color: Colors.greenAccent.shade700,
        value: 170,
        radius: 50,
        title: '170',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: Colors.orangeAccent.shade700,
        value: 302,
        radius: 50,
        title: '302',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: Colors.redAccent.shade700,
        value: 106,
        radius: 50,
        title: '106',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: Colors.grey.shade600,
        value: 260,
        radius: 50,
        title: '260',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
  }

  Widget overallPieBarChartItem({
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
