import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mam_sana_afzal/Custome_Widget/imageScreen.dart';

import 'Assessment_SuperAdmin.dart';
import 'SuperAdminHomeScreen.dart';

class SuperAdminHome extends StatefulWidget {
  const SuperAdminHome({super.key});

  @override
  State<SuperAdminHome> createState() => _SuperAdminHomeState();
}

class _SuperAdminHomeState extends State<SuperAdminHome> {
  int _selectedIndex = 0;

  List<Widget> tabItems = [
    ///just here you put the screens
    SuperAdminHomeScreen(),
    ImageScreen(),
    AssessmentSuperAdmin(),
    Center(child: Text("Furniture")),
    Center(child: Text("profile")),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: tabItems[_selectedIndex],
      ),
      bottomNavigationBar: FlashyTabBar(
        animationCurve: Curves.linear,
        selectedIndex: _selectedIndex,
        iconSize: 30,
        showElevation: false, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _selectedIndex = index;
        }),
        items: [
          FlashyTabBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.image),
            title: Text('Images'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.assessment),
            title: Text('Assessment'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.flash_on),
            title: Text('profile'),
          ),
          FlashyTabBarItem(
            icon: Icon(Icons.person),
            title: Text('profile'),
          ),

        ],
      ),
    );
  }
}