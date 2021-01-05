import 'package:flutter/material.dart';
import 'package:mm_message_qr/message_screen.dart';
import 'package:mm_message_qr/scan_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(child: Text("QR Code Screen"), onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ScanScreen()));
              }),
              SizedBox(width: 20),
              RaisedButton(
                  child: Text("Message Screen"),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MessageScreen()));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
