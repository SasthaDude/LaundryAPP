import 'dart:ui';
import 'package:flutter/material.dart';

import '../../THEMES/BasicTheme.dart';

class ConnectedNotSaleDetails extends StatefulWidget {
  const ConnectedNotSaleDetails({super.key});

  @override
  State<ConnectedNotSaleDetails> createState() => _ConnectedNotSaleDetailsState();
}

class _ConnectedNotSaleDetailsState extends State<ConnectedNotSaleDetails> {
  final int _entryCount = 10; // Change this to the desired number of entries
  List<String> _phoneNumbers = [];
  List<String> _names = [];
  List<String> _statuses = [];
  List<String> _services = [];
  List<String> _reviews = [];
  List<bool> _isSaved = [];

  final Map<String, Color> statusColors = {
    'Connected/Sale': Colors.green,
    'Connected/Not Sale': Colors.blue,
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
      _statuses.add('Connected/Not Sale'); // Set default status
      _services.add('Service ${i + 1}');
      _reviews.add('Review for Person ${i + 1}'); // Sample reviews
      _isSaved.add(false);
    }
  }

  Color _getStatusColor(String value) {
    return statusColors[value] ?? Colors.grey;
  }

  Future<void> _navigateToEditPage(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditSaleDetails(
          name: _names[index],
          phoneNumber: _phoneNumbers[index],
          service: _services[index],
          status: _statuses[index],
          review: _reviews[index],
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _names[index] = result['name'];
        _phoneNumbers[index] = result['phoneNumber'];
        _services[index] = result['service'];
        _statuses[index] = result['status'];
        _reviews[index] = result['review'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade400.withOpacity(0.6),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Connected/Not Sale'),
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
                            IconButton(
                              onPressed: () => _navigateToEditPage(index),
                              icon: const Icon(Icons.edit),
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
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 12.0,
                                    ),
                                    decoration: BoxDecoration(
                                      color: _getStatusColor(_statuses[index]),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      _statuses[index],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
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
                        Text(
                          _reviews[index],
                          style: const TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class EditSaleDetails extends StatefulWidget {
  final String name;
  final String phoneNumber;
  final String service;
  final String status;
  final String review;

  const EditSaleDetails({
    Key? key,
    required this.name,
    required this.phoneNumber,
    required this.service,
    required this.status,
    required this.review,
  }) : super(key: key);

  @override
  _EditSaleDetailsState createState() => _EditSaleDetailsState();
}

class _EditSaleDetailsState extends State<EditSaleDetails> {
  late TextEditingController _nameController;
  late TextEditingController _phoneController;
  late TextEditingController _serviceController;
  late TextEditingController _reviewController;
  late String _selectedStatus;

  final List<String> _dropdownOptions = [
    'Connected/Sale',
    'Connected/Not Sale',
    'Not Connected',
    'Unable to Connect',
  ];

  final Map<String, Color> dropdownColors = {
    'Connected/Sale': Colors.green,
    'Connected/Not Sale': Colors.blue,
    'Not Connected': Colors.red,
    'Unable to Connect': Colors.orange,
  };

  Color _getDropdownColor(String value) {
    return dropdownColors[value] ?? Colors.grey;
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.name);
    _phoneController = TextEditingController(text: widget.phoneNumber);
    _serviceController = TextEditingController(text: widget.service);
    _reviewController = TextEditingController(text: widget.review);
    _selectedStatus = widget.status; // Set initial value for dropdown
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _serviceController.dispose();
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Sale Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Mobile Number'),
            ),
            TextField(
              controller: _serviceController,
              decoration: const InputDecoration(labelText: 'Service'),
            ),
            const SizedBox(height: 16),
            const Text('Status:'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: _getDropdownColor(_selectedStatus), // Dynamically update color
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: _selectedStatus, // Selected dropdown value
                  items: _dropdownOptions.map((String option) {
                    return DropdownMenuItem<String>(
                      value: option,
                      child: Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            margin: const EdgeInsets.only(right: 8.0),
                            decoration: BoxDecoration(
                              color: _getDropdownColor(option), // Color for each option
                              shape: BoxShape.circle,
                            ),
                          ),
                          Text(option),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedStatus = newValue!; // Update selected status
                    });
                  },
                  dropdownColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _reviewController,
              decoration: const InputDecoration(labelText: 'Review'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Return updated data to the previous screen
                Navigator.pop(context, {
                  'name': _nameController.text,
                  'phoneNumber': _phoneController.text,
                  'service': _serviceController.text,
                  'status': _selectedStatus,
                  'review': _reviewController.text,
                });
              },
              child: const Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
