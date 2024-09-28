import 'package:flutter/material.dart';
import 'package:whatsapp/pages/chat_page.dart';
import 'home_page.dart'; // Make sure this file exists

void main() {
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp',
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white12,
          titleTextStyle: TextStyle(
            color: Colors.green,fontWeight: FontWeight.w500,fontSize: 25
          )
        ),
      ),
      home: ContactsScreen(),
    );
  }
}
