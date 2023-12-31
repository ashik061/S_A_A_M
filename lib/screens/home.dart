import 'package:firebase_auth/firebase_auth.dart';
import 'package:s_a_a_m/auth.dart';
import 'package:flutter/material.dart';
import 'package:s_a_a_m/screens/face_scan.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

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

      drawer: Drawer(
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
                  // handle action
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
                  // Handle  action
                  Navigator.pop(context);
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
                  signOut();
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      leading: const Icon(Icons.people_alt_outlined),
                      title: const Text('Join a class'),
                      onTap: () {
                        // Handle  action
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.person_outline),
                      title: const Text('Create a class'),
                      onTap: () {
                        // Handle action
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
        backgroundColor: Colors.blueGrey[900],
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset(
                  'images/launcher_icon.png',
                  height: 200,
                  width: 200,
                ),
              ),
              //const SizedBox(height: 10),
              const Text(
                'Welcome to S A A M !',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              const SizedBox(height: 25),

              const Text(
                'Please scan your face before joining a class.',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(
                height: 40,
              ),

              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FaceScan(),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blueGrey[900],
                        borderRadius: BorderRadius.circular(20)),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                          'Scan Face',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
