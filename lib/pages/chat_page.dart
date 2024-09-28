import 'package:flutter/material.dart';

class ContactsScreen extends StatefulWidget {
  @override
  _ContactsScreenState createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  final List<Contact> contacts = [
    Contact(name: 'Ravi', message: 'Hey! How are you?', time: '10:20 AM'),
    Contact(name: 'Chandu', message: 'Market jana hai.', time: '7:20 AM'),
    Contact(name: 'Kaushiki', message: 'See you tomorrow!', time: '6:50 PM'),
    Contact(name: 'Pallavi', message: 'Let\'s catch up.', time: 'Yesterday'),
    Contact(name: 'Ankit Bhaiya', message: 'Can you send the files?', time: '2:15 PM'),
    Contact(name: 'Sonu', message: 'Photo bhej', time: '10:00 AM'),
    Contact(name: 'Prakash', message: 'Gaw kb ja rahe ho?', time: '3:34 PM'),
    Contact(name: 'Sunny', message: 'Hey! How are you?', time: '5:56 AM'),
    Contact(name: 'Amrendra', message: 'call me', time: '6:20 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Ask Meta AI or Search',
                filled: true,
                fillColor: Colors.white70,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Container(
                  height: 35,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Text(
                      'All',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Container(
                  height: 35,
                  width: 76,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: Text(
                      'Unread',
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: Text(
                      'Favorites',
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: 6),
                Container(
                  height: 35,
                  width: 76,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    color: Colors.black12,
                  ),
                  child: Center(
                    child: Text(
                      'Groups',
                      style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12), // Add some space between the row and the list
            ListView.builder(
              shrinkWrap: true, // Important to allow ListView to take up only the needed space
              physics: NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Text(contacts[index].name[0]),
                  ),
                  title: Row(
                    children: [
                      Expanded(
                        child: Text(
                          contacts[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        contacts[index].time,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  subtitle: Text(contacts[index].message),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(contactName: contacts[index].name),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Contact {
  final String name;
  final String message;
  final String time;

  Contact({required this.name, required this.message, required this.time});
}

class ChatScreen extends StatelessWidget {
  final String contactName;

  ChatScreen({required this.contactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contactName),
      ),
      body: Center(
        child: Text('Chat with $contactName'),
      ),
    );
  }
}
