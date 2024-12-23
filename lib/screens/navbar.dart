import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: tdBGColor,

      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: tdBlue,
            ),
            child: Text(
              "Menu",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),

          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: (){
              print("Click Detected - Settings");
            },
          ),
          
          ListTile(
            leading: Icon(Icons.info),
            title: Text("About"),
            onTap: (){
              print("Click Detected - About");
            },
          ),
        ],
      ),
    );
  }
}
