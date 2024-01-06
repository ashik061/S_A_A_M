import 'package:flutter/material.dart';
import 'package:s_a_a_m/screens/home_class.dart';
import 'package:s_a_a_m/screens/student_classroom.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueGrey[900],
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Column(
              children: [
                Image.asset('images/launcher_icon.png'),
                const Text(
                  'SAAM',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      letterSpacing: 4),
                ),
              ],
            ),
          ),

          //other menu
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: const Icon(
                Icons.home_work_sharp,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Classes',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ClassesHome()));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: const Icon(
                Icons.add_chart,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Attendance',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const StudentClassroom()));
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: const Icon(
                Icons.co_present_rounded,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onTap: () {
                // Handle  action
                Navigator.pop(context);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: const Icon(
                Icons.linked_camera,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Scan Face',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onTap: () {
                // Handle  action
                Navigator.pop(context);
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: const Icon(
                Icons.archive,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Archived',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onTap: () {
                // handle action
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onTap: () {
                // handle action
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
                size: 35,
              ),
              title: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              onTap: () {
                //signOut();
              },
            ),
          ),
        ],
      ),
    );
  }
}
