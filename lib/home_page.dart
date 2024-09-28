import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // To keep track of the selected index

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
        ],

      ),
      body: Padding(
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
            SizedBox(height: 15,),
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
                SizedBox(width: 6,),
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
                      style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: 6,),
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
                      style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(width: 6,),
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
                      style: TextStyle(color: Colors.black54,fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            )

          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 92,
        child: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBottomNavItem(Icons.chat, 'Chat', 0),
              _buildBottomNavItem(Icons.update_sharp, 'Updates', 1),
              _buildBottomNavItem(Icons.groups_outlined, 'Communities', 2),
              _buildBottomNavItem(Icons.call, 'Calls', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index; // Check if this item is selected
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: isSelected ? Colors.green : Colors.black, // Change color based on selection
          ),
          onPressed: () {
            _onItemTapped(index); // Update selected index on tap
          },
        ),
        Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.green : Colors.black, // Change text color based on selection
          ),
        ),
      ],
    );
  }
}
