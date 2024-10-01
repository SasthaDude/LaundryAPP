import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ReportAnalysis extends StatefulWidget {
  @override
  State<ReportAnalysis> createState() => _ReportAnalysisState();
}

class _ReportAnalysisState extends State<ReportAnalysis> {
  bool reportShowPieChart = true;

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
              "Report Analysis",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.05,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  reportShowPieChart = !reportShowPieChart;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Icon(
                  reportShowPieChart ? Icons.bar_chart : Icons.pie_chart,
                  color: Colors.red,
                  size: screenWidth * 0.08,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: reportShowPieChart
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
                    height: screenHeight * 0.3,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        PieChart(
                          PieChartData(
                            sections: reportPieChartSections(),
                            borderData: FlBorderData(show: false),
                            centerSpaceRadius: 50,
                            sectionsSpace: 4,
                          ),
                        ),
                        Text(
                          "950",
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
                      reportPieBarChartItem(
                        icon: Icons.check_circle_outline,
                        text: "Connected - Sale",
                        value: 300,
                        color: Colors.greenAccent.shade700,
                      ),
                      reportPieBarChartItem(
                        icon: Icons.error_outline,
                        text: "Connected - Not Sale",
                        value: 250,
                        color: Colors.blueAccent.shade700,
                      ),
                      reportPieBarChartItem(
                        icon: MdiIcons.wifiOff,
                        text: "Unable to Connect",
                        value: 150,
                        color: Colors.orangeAccent.shade700,
                      ),
                      reportPieBarChartItem(
                        icon: Icons.power_settings_new,
                        text: "Not Connected",
                        value: 250,
                        color: Colors.redAccent.shade700,
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
                    child: Container(
                      height: screenHeight * 0.3,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceEvenly,
                          maxY: 350,
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
                                interval: 100,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.04,
                                      color: Colors.black,
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
                                  toY: 300,
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
                                  toY: 250,
                                  color: Colors.blueAccent.shade700,
                                  width: 24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 2,
                              barRods: [
                                BarChartRodData(
                                  toY: 150,
                                  color: Colors.orangeAccent.shade700,
                                  width: 24,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ],
                            ),
                            BarChartGroupData(
                              x: 3,
                              barRods: [
                                BarChartRodData(
                                  toY: 250,
                                  color: Colors.redAccent.shade700,
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
                      reportPieBarChartItem(
                        icon: Icons.check_circle_outline,
                        text: 'Connected - Sale',
                        color: Colors.greenAccent.shade700,
                        value: 300,
                      ),
                      reportPieBarChartItem(
                        icon: Icons.error_outline,
                        text: 'Connected - Not Sale',
                        color: Colors.blueAccent.shade700,
                        value: 250,
                      ),
                      reportPieBarChartItem(
                        icon: MdiIcons.wifiOff,
                        text: 'Unable to Connect',
                        color: Colors.orangeAccent.shade700,
                        value: 150,
                      ),
                      reportPieBarChartItem(
                        icon: Icons.power_settings_new,
                        text: 'Not Connected',
                        color: Colors.redAccent.shade700,
                        value: 250,
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

  List<PieChartSectionData> reportPieChartSections() {
    return [
      PieChartSectionData(
        color: Colors.greenAccent.shade700,
        value: 300,
        radius: 50,
        title: '300',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: Colors.blueAccent.shade700,
        value: 250,
        radius: 50,
        title: '250',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: Colors.orangeAccent.shade700,
        value: 150,
        radius: 50,
        title: '150',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      PieChartSectionData(
        color: Colors.redAccent.shade700,
        value: 250,
        radius: 50,
        title: '250',
        titleStyle: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ];
  }

  Widget reportPieBarChartItem({
    required IconData icon,
    required String text,
    required int value,
    required Color color,
  }) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 6,
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          leading: Icon(icon, size: 25, color: Colors.white),
          title: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          trailing: Text(
            "${value}",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
