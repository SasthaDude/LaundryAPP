import 'dart:ui';

import 'package:flutter/material.dart';

import '../../THEMES/BasicTheme.dart';

class OtherLeadsDetails extends StatefulWidget {
  const OtherLeadsDetails({super.key});

  @override
  State<OtherLeadsDetails> createState() => _OtherLeadsDetailsState();
}

class _OtherLeadsDetailsState extends State<OtherLeadsDetails> {
  final int _entryCount = 10; // Change this to the desired number of entries
  List<String> _phoneNumbers = [];
  List<String> _names = [];
  List<String> _dropdownValues = [];
  List<String> _services = [];
  List<String> _reviews = [];
  List<bool> _isSaved = [];
  List<bool> _isMinimized = [];

  final List<String> _dropdownOptions = [
    'Connected/Sale',
    'Connected/Notsale',
    'Not Connected',
    'Unable to Connect',
  ];

  final Map<String, Color> dropdownColors = {
    'Connected/Sale': Colors.green,
    'Connected/Notsale': Colors.blue,
    'Not Connected': Colors.red,
    'Unable to Connect': Colors.orange,
  };

  @override
  void initState() {
    super.initState();
    _initializeEntries();
  }

  void _initializeEntries() {
    for (int i = 0; i < _entryCount; i++) {
      _names.add('Person ${i + 1}');
      _phoneNumbers.add('12345678${i % 10}'); // Generate phone numbers
      _dropdownValues.add('Select Status');
      _services.add('Service ${i + 1}');
      _reviews.add('');
      _isSaved.add(false);
      _isMinimized.add(false);
    }
  }

  Color _getDropdownColor(String value) {
    return dropdownColors[value] ?? Colors.grey;
  }

  void _saveReview(int index) {
    setState(() {
      _isSaved[index] = true;
      _isMinimized[index] = true;

      final String savedName = _names[index];
      final String savedPhone = _phoneNumbers[index];
      final String savedDropdown = _dropdownValues[index];
      final String savedReview = _reviews[index];

      // Remove the current entry
      _names.removeAt(index);
      _phoneNumbers.removeAt(index);
      _dropdownValues.removeAt(index);
      _reviews.removeAt(index);
      _isSaved.removeAt(index);
      _isMinimized.removeAt(index);

      // Add the entry to the end of the list
      _names.add(savedName);
      _phoneNumbers.add(savedPhone);
      _dropdownValues.add(savedDropdown);
      _reviews.add(savedReview);
      _isSaved.add(true);
      _isMinimized.add(true);

    });

  }

  void _toggleMinimized(int index) {
    setState(() {
      _isMinimized[index] = !_isMinimized[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade400.withOpacity(0.6),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back)),
        title: const Text('Other Leads'),
      ),
      body: Stack(
        children: [
          BackgroundImageContainer(context),

          ListView.builder(
            itemCount: _names.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!_isMinimized[index]) ...[
                          // Expanded view
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Name:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _names[index],
                                      style: const TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Mobile Number:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _phoneNumbers[index],
                                      style: const TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Service:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      _services[index],
                                      style: const TextStyle(color: Colors.black54),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Status:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      decoration: BoxDecoration(
                                        color: _getDropdownColor(_dropdownValues[index]),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          isExpanded: true,
                                          value: _dropdownValues[index],
                                          items: _dropdownOptions.map((String option) {
                                            return DropdownMenuItem<String>(
                                              value: option,
                                              child: Container(
                                                color: _getDropdownColor(option),
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  option,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            );
                                          }).toList()
                                            ..insert(0, DropdownMenuItem<String>(
                                              value: 'Select Status',
                                              child: Container(
                                                color: Colors.grey,
                                                padding: const EdgeInsets.all(8.0),
                                                child: const Text(
                                                  'Select Status',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                            )),
                                          onChanged: (newValue) {
                                            setState(() {
                                              _dropdownValues[index] = newValue!;
                                            });
                                          },
                                          style: const TextStyle(
                                            color: Colors.white,
                                          ),
                                          dropdownColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Review:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {
                                    _reviews[index] = value;
                                  },
                                  controller: TextEditingController(text: _reviews[index]),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    hintText: 'Enter review',
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: _dropdownValues[index] == 'Select Status' ? null : () {
                                  _saveReview(index);
                                },
                                child: const Text('Save'),
                              ),
                            ],
                          ),
                        ] else ...[
                          // Minimized view
                          GestureDetector(
                            onTap: () => _toggleMinimized(index),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        _names[index],
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Container(
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: _getDropdownColor(_dropdownValues[index]),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      _dropdownValues[index],
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Icon(
                                  _isMinimized[index] ? Icons.arrow_drop_down : Icons.arrow_forward,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      )
    );
  }
}






