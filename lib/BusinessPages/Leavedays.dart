import 'package:flutter/material.dart';

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  final List<String> _weekDays = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];

  final List<String> _selectedDays = [];

  void _showDaySelectionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: Text('Select Leave Days'),
              content: SizedBox(
                width: double.maxFinite,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _weekDays.length,
                  itemBuilder: (context, index) {
                    bool isSelected = _selectedDays.contains(_weekDays[index]);
                    return CheckboxListTile(
                      title: Text(_weekDays[index]),
                      value: isSelected,
                      onChanged: (bool? value) {
                        setDialogState(() {
                          if (value == true && !_selectedDays.contains(_weekDays[index])) {
                            setState(() {
                              _selectedDays.add(_weekDays[index]);
                            });
                          } else {
                            setState(() {
                              _selectedDays.remove(_weekDays[index]);
                            });
                          }
                        });
                      },
                      controlAffinity: ListTileControlAffinity.leading,
                    );
                  },
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Done'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _navigateToNewPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectedDaysPage(selectedDays: _selectedDays),
      ),
    );
  }

  void _removeSelectedDay(String day) {
    setState(() {
      _selectedDays.remove(day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leave Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () => _showDaySelectionDialog(context),
              child: Text('Select Leave Days'),
            ),
            SizedBox(height: 20),
            Text("Selected Leave Days:"),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: _selectedDays
                    .map(
                      (day) => Chip(
                    label: Text(day),
                    deleteIcon: Icon(Icons.cancel),
                    onDeleted: () => _removeSelectedDay(day),
                  ),
                )
                    .toList(),
              ),
            ),
            ElevatedButton(
                onPressed: (){
                  _navigateToNewPage(context);
                },
                child: Text("doneee"))
          ],
        ),
      ),
    );
  }
}

class SelectedDaysPage extends StatelessWidget {
  final List<String> selectedDays;

  const SelectedDaysPage({Key? key, required this.selectedDays}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selected Leave Days"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("You have selected the following days:"),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: selectedDays
                    .map(
                      (day) => Chip(
                    label: Text(day),
                  ),
                )
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
