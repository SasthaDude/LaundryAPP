import 'package:flutter/material.dart';

class BusinessHrs extends StatefulWidget {
  const BusinessHrs({super.key});

  @override
  State<BusinessHrs> createState() => _BusinessHrsState();
}

class _BusinessHrsState extends State<BusinessHrs> {
  // To store selected days and their respective times
  Map<String, Map<String, String>> selectedBusinessHours = {};

  // Days of the week
  final List<String> days = [
    'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
  ];

  // Flag to show business hours list after clicking "add"
  bool showBusinessHoursList = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Hours'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Business Hours',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.add_circle_outline, color: Colors.blue),
                  onPressed: () {
                    setState(() {
                      showBusinessHoursList = true; // Show the list when the add button is clicked
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Conditionally show the business hours list after clicking the add button
            if (showBusinessHoursList)
              Column(
                children: [
                  ...days.map((day) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "$day",
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              _showBottomSheet(day);
                            },
                            child: Row(
                              children: [
                                Text(
                                  selectedBusinessHours.containsKey(day)
                                      ? "${selectedBusinessHours[day]!['open']} - ${selectedBusinessHours[day]!['close']}"
                                      : "Closed",
                                  style: const TextStyle(color: Colors.black),
                                ),
                                const Icon(Icons.arrow_drop_down_outlined),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showBusinessHoursList = false; // Hide the list when confirm is clicked
                      });
                    },
                    child: const Text("Confirm"),
                  ),
                ],
              ),

            const SizedBox(height: 20),

            // Button to navigate to the clientside page to view business hours
            ElevatedButton(
              onPressed: () {
                // Navigate to the clientside page and pass the selectedBusinessHours map
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => clientside(
                //       businessHours: selectedBusinessHours,
                //     ),
                //   ),
                // );
              },
              child: const Text("View Business Hours"),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show bottom sheet for a specific day
  void _showBottomSheet([String? day]) {
    String selectedOpenTime = '12:00 AM';
    String selectedCloseTime = '12:00 PM';

    if (day != null && selectedBusinessHours.containsKey(day)) {
      selectedOpenTime = selectedBusinessHours[day]!['open']!;
      selectedCloseTime = selectedBusinessHours[day]!['close']!;
    }

    showModalBottomSheet(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setBottomSheetState) {
            return Container(
              padding: const EdgeInsets.all(16),
              height: 400,
              child: Column(
                children: [
                  // Display the selected day
                  if (day != null)
                    Text('Edit Hours for $day',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),

                  const SizedBox(height: 20),

                  // Open Time Picker
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text("Open Time"),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue, // Button color
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                            ),
                            onPressed: () async {
                              final result = await showCustomTimePicker(context);
                              if (result != null) {
                                setBottomSheetState(() {
                                  selectedOpenTime = result;
                                });
                              }
                            },
                            child: Text(selectedOpenTime),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text("Close Time"),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.blue, // Button color
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Padding
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10), // Rounded corners
                              ),
                            ),
                            onPressed: () async {
                              final result = await showCustomTimePicker(context);
                              if (result != null) {
                                setBottomSheetState(() {
                                  selectedCloseTime = result;
                                });
                              }
                            },
                            child: Text(selectedCloseTime),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  // Confirm button
                  ElevatedButton(
                    onPressed: () {
                      if (day != null) {
                        setState(() {
                          selectedBusinessHours[day] = {
                            'open': selectedOpenTime,
                            'close': selectedCloseTime,
                          };
                        });
                        Navigator.pop(context); // Close the bottom sheet
                      }
                    },
                    child: const Text("Confirm"),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Function to show custom time picker
  Future<String?> showCustomTimePicker(BuildContext context) {
    int selectedHour = 7;
    int selectedMinute = 0;
    String selectedPeriod = 'AM';

    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'ENTER TIME',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Hour Picker
                      DropdownButton<int>(
                        value: selectedHour,
                        items: List.generate(12, (index) => index + 1)
                            .map((hour) => DropdownMenuItem<int>(
                          value: hour,
                          child: Text(hour.toString(), style: const TextStyle(fontSize: 24)),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedHour = value!;
                          });
                        },
                      ),
                      const Text(
                        ':',
                        style: TextStyle(fontSize: 24),
                      ),
                      // Minute Picker
                      DropdownButton<int>(
                        value: selectedMinute,
                        items: List.generate(60, (index) => index)
                            .map((minute) => DropdownMenuItem<int>(
                          value: minute,
                          child: Text(minute.toString().padLeft(2, '0'),
                              style: const TextStyle(fontSize: 24)),
                        ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedMinute = value!;
                          });
                        },
                      ),
                      const SizedBox(width: 20),
                      // AM/PM Picker
                      Column(
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                selectedPeriod = 'AM';
                              });
                            },
                            child: const Text("AM"),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: selectedPeriod == 'AM' ? Colors.purple.shade100 : null,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              setState(() {
                                selectedPeriod = 'PM';
                              });
                            },
                            child: const Text("PM"),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: selectedPeriod == 'PM' ? Colors.purple.shade100 : null,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("CANCEL"),
                      ),
                      TextButton(
                        onPressed: () {
                          String formattedTime =
                              '$selectedHour:${selectedMinute.toString().padLeft(2, '0')} $selectedPeriod';
                          Navigator.pop(context, formattedTime);
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

