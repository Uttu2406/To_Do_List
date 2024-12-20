import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15)),
            Text("Hello World",),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              
            ),
          ],
        ),
      ),
    );
  }
}