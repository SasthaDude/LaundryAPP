import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  final List<Map<String, dynamic>> _comments = [
    {
      'userName': 'User1',
      'userComment': 'This is the first comment',
      'userRating': 4.0,
      'adminReply': null,
      'isReplying': false,
      'userAvatar': Icons.person, // Placeholder for avatar
    },
    {
      'userName': 'User2',
      'userComment': 'This is the second comment',
      'userRating': 3.5,
      'adminReply': null,
      'isReplying': false,
      'userAvatar': Icons.person, // Placeholder for avatar
    }
  ];

  final bool _isAdmin = true; // Change this based on user role

  void _replyToComment(int index, String reply) {
    setState(() {
      _comments[index]['adminReply'] = reply;
      _comments[index]['isReplying'] = false; // Hide reply field after reply
    });
  }

  void _deleteComment(int index) {
    setState(() {
      _comments.removeAt(index);
    });
  }

  void _toggleReplying(int index) {
    setState(() {
      _comments[index]['isReplying'] = !_comments[index]['isReplying'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        itemCount: _comments.length,
        itemBuilder: (context, index) {
          final comment = _comments[index];
          final TextEditingController _replyController = TextEditingController();

          return Container(
            margin: EdgeInsets.only(bottom: 8.0), // Adjust margin
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Adjust padding
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      child: Icon(comment['userAvatar'], color: Colors.white),
                      backgroundColor: Colors.blueAccent,
                      radius: 16,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                comment['userName'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: 6),
                              RatingBarIndicator(
                                rating: comment['userRating'],
                                itemBuilder: (context, index) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 16.0,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  comment['userComment'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              if (_isAdmin)
                                PopupMenuButton<String>(
                                  icon: Icon(Icons.more_vert),
                                  onSelected: (value) {
                                    if (value == 'Delete') {
                                      _showDeleteConfirmationDialog(context, index);
                                    }
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return {'Delete'}.map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                ),
                            ],
                          ),
                          SizedBox(height: 8),
                          if (comment['adminReply'] != null)
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue.shade50,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.blueAccent,
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Admin Reply:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blueAccent,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    comment['adminReply'], // The reply text
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                    ),
                                    softWrap: true, // Ensures the text wraps within the available space
                                  ),
                                ],
                              ),
                            )
                          else if (_isAdmin)
                            comment['isReplying']
                                ? Column(
                              children: [
                                TextField(
                                  controller: _replyController,
                                  decoration: InputDecoration(
                                    hintText: 'Write your reply...',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          _toggleReplying(index);
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          if (_replyController.text.isNotEmpty) {
                                            _replyToComment(index, _replyController.text);
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.white,
                                          backgroundColor: Colors.blueAccent,
                                        ),
                                        child: Text('Reply'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                                : Align(
                              alignment: Alignment.centerRight,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  _toggleReplying(index);
                                },
                                icon: Icon(Icons.reply),
                                label: Text('Reply'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blueAccent,
                                  elevation: 2,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Delete Comment'),
          content: Text('Are you sure you want to delete this comment?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _deleteComment(index);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blueAccent,
              ),
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
