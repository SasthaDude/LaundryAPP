import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/providerexample.dart';
//
// class Demossawwe extends StatefulWidget {
//   const Demossawwe({super.key});
//
//   @override
//   State<Demossawwe> createState() => _DemossawweState();
// }
//
// class _DemossawweState extends State<Demossawwe> {
//   final int _entryCount = 10;
//   List<String> _phoneNumbers = [];
//   List<String> _names = [];
//   List<String> _dropdownValues = [];
//   List<String> _services = [];
//   List<String> _reviews = [];
//   List<bool> _isSaved = [];
//   List<bool> _isMinimized = [];
//
//   final List<String> _dropdownOptions = [
//     'Connected/Sale',
//     'Connected/Notsale',
//     'Not Connected',
//     'Unable to Connect',
//   ];
//
//   final Map<String, Color> dropdownColors = {
//     'Connected/Sale': Colors.green,
//     'Connected/Notsale': Colors.blue,
//     'Not Connected': Colors.red,
//     'Unable to Connect': Colors.orange,
//   };
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeEntries();
//   }
//
//   void _initializeEntries() {
//     for (int i = 0; i < _entryCount; i++) {
//       _names.add('Person ${i + 1}');
//       _phoneNumbers.add('12345678${i % 10}');
//       _dropdownValues.add('Select Status');
//       _services.add('Service ${i + 1}');
//       _reviews.add('');
//       _isSaved.add(false);
//       _isMinimized.add(false);
//     }
//   }
//
//   Color _getDropdownColor(String value) {
//     return dropdownColors[value] ?? Colors.grey;
//   }
//
//   void _saveReview(int index) {
//     setState(() {
//       _isSaved[index] = true;
//       _isMinimized[index] = true;
//
//       // Update the provider's EntryModel with the current entry's details
//       Provider.of<EntryModel>(context, listen: false).updateEntry(
//         newName: _names[index],
//         newPhone: _phoneNumbers[index],
//         newService: _services[index],
//         newStatus: _dropdownValues[index],
//         newReview: _reviews[index],
//       );
//
//       // Show the details page (replace with navigation logic if needed)
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const detailspagessew(),
//         ),
//       );
//     });
//   }
//
//   void _toggleMinimized(int index) {
//     setState(() {
//       _isMinimized[index] = !_isMinimized[index];
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Demo'),
//       ),
//       body: ListView.builder(
//         itemCount: _names.length,
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Card(
//               elevation: 8,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//                 side: const BorderSide(
//                   color: Colors.blue,
//                   width: 2,
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     if (!_isMinimized[index]) ...[
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Name:',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   _names[index],
//                                   style: const TextStyle(color: Colors.black54),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Mobile Number:',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   _phoneNumbers[index],
//                                   style: const TextStyle(color: Colors.black54),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Service:',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   _services[index],
//                                   style: const TextStyle(color: Colors.black54),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           const SizedBox(width: 16),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const Text(
//                                   'Status:',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                                   decoration: BoxDecoration(
//                                     color: _getDropdownColor(_dropdownValues[index]),
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: DropdownButtonHideUnderline(
//                                     child: DropdownButton<String>(
//                                       isExpanded: true,
//                                       value: _dropdownValues[index],
//                                       items: _dropdownOptions.map((String option) {
//                                         return DropdownMenuItem<String>(
//                                           value: option,
//                                           child: Container(
//                                             color: _getDropdownColor(option),
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Text(
//                                               option,
//                                               style: const TextStyle(
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         );
//                                       }).toList()
//                                         ..insert(0, DropdownMenuItem<String>(
//                                           value: 'Select Status',
//                                           child: Container(
//                                             color: Colors.grey,
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: const Text(
//                                               'Select Status',
//                                               style: TextStyle(
//                                                 color: Colors.white,
//                                               ),
//                                             ),
//                                           ),
//                                         )),
//                                       onChanged: (newValue) {
//                                         setState(() {
//                                           _dropdownValues[index] = newValue!;
//                                         });
//                                       },
//                                       style: const TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                       dropdownColor: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       const Text(
//                         'Review:',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: TextField(
//                               onChanged: (value) {
//                                 _reviews[index] = value;
//                               },
//                               controller: TextEditingController(text: _reviews[index]),
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 hintText: 'Enter review',
//                                 contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               _saveReview(index);
//                             },
//                             child: const Text('Save'),
//                           ),
//                         ],
//                       ),
//                     ] else ...[
//                       GestureDetector(
//                         onTap: () => _toggleMinimized(index),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     _names[index],
//                                     style: const TextStyle(fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             const SizedBox(width: 16),
//                             Container(
//                               height: 30,
//                               padding: const EdgeInsets.symmetric(horizontal: 12),
//                               decoration: BoxDecoration(
//                                 color: _getDropdownColor(_dropdownValues[index]),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Center(
//                                 child: Text(
//                                   _dropdownValues[index],
//                                   style: const TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                             Icon(
//                               _isMinimized[index] ? Icons.arrow_drop_down : Icons.arrow_forward,
//                               color: Colors.blue,
//                               size: 30,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

//
// class detailspagess extends StatefulWidget {
//   const detailspagess({super.key});
//
//   @override
//   State<detailspagess> createState() => _detailspagessState();
// }
//
// class _detailspagessState extends State<detailspagess> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: 100,
//             width: 200,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               border: Border.all(),
//             ),
//             child: Text("Connected/sale"),
//           ),
//           Container(
//             height: 100,
//             width: 200,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               border: Border.all(),
//             ),
//             child: Text("Connected/notsale"),
//           ),
//           Container(
//             height: 100,
//             width: 200,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               border: Border.all(),
//             ),
//             child: Text("not Connected"),
//           ),
//           Container(
//             height: 100,
//             width: 200,
//             decoration: BoxDecoration(
//               color: Colors.green,
//               border: Border.all(),
//             ),
//             child: Text("unable to Connected"),
//           ),
//         ],
//       ),
//     );
//   }
// }

