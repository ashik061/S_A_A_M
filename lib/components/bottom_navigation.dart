import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigation extends StatelessWidget {
  void Function(int)? onTabChange;

  BottomNavigation({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(
        color: Colors.blueGrey[900],
        activeColor: Colors.blueGrey[900],
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.blueGrey.shade200,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        tabBorderRadius: 05,
        iconSize: 30,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
            icon: Icons.stream,
            text: 'Stream',
          ),
          GButton(
            icon: Icons.add_chart,
            text: 'Attendance',
          ),
          GButton(
            icon: Icons.people_alt,
            text: 'People',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
