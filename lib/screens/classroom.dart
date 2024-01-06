import 'package:flutter/material.dart';
import 'package:s_a_a_m/components/bottom_navigation.dart';
import 'package:s_a_a_m/components/navigation_drawer.dart';
import 'package:s_a_a_m/screens/attendance.dart';
import 'package:s_a_a_m/screens/people.dart';
import 'package:s_a_a_m/screens/settings.dart';
import 'package:s_a_a_m/screens/stream.dart';

class ClassRoom extends StatefulWidget {
  const ClassRoom({super.key});

  @override
  State<ClassRoom> createState() => _ClassRoomState();
}

class _ClassRoomState extends State<ClassRoom> {
  // Bottom Navigation Bar Control

  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const StreamPage(),
    const AttendancePage(),
    const PeoplePage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: const Text(
          'SAAM',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
              letterSpacing: 4),
        ),
        elevation: 0,

        // Main Menu

        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 35,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        }),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.calendar_month_outlined,
              color: Colors.white,
              size: 35,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
              size: 35,
            ),
          )
        ],
      ),

      // Navigation Drawer

      drawer: const DrawerWidget(),

      // Bottom Navigation of classrooms

      body: _pages[_selectedIndex],

      bottomNavigationBar: BottomNavigation(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      floatingActionButton: SizedBox(
        height: 80,
        width: 80,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blueGrey[900],
          shape: const CircleBorder(),
          child: const Icon(
            Icons.camera_enhance_outlined,
            size: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
