import 'package:flutter/material.dart';
import 'package:to_do/constants/colors.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  final double coverheight = 175;
  final double profileheight = 120;


  @override
  Widget build(BuildContext context) {
    final double top = coverheight - profileheight/2;

    return Drawer(
      backgroundColor: tdBGColor,
      

      child: ListView(
        children: [

          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            
            children: [
              Container(
                width: 400,
                height: coverheight,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: ClipRect(                  
                  clipBehavior: Clip.hardEdge ,
                  child: Image.asset("assets/todo_banner.webp"),
                ),
              ),
              
              Center(
                child: Positioned(
                  top: top,
                  child: CircleAvatar(
                      radius: profileheight/2,
                      child: ClipOval(
                        child: Image.asset("assets/uttu.png"),
                      ),
                    ),
                ),
              ),
            ],
          )







          // UserAccountsDrawerHeader(
          //   accountName: Text("Utkrisht Bhandari", style: TextStyle(color: Colors.black)),
          //   accountEmail: Text("bhandari.krish.kb@gmail.com",  style: TextStyle(color: Colors.black),),
          //   currentAccountPicture: CircleAvatar(
          //     // child: ClipOval(
          //       child: Image.asset("assets/uttu.png"),
          //     // ),
          //   ),

          //   decoration: BoxDecoration(
          //     color: tdBGColor,
          //   ),
          // ),

        ],
      ),
    );
  }
}
