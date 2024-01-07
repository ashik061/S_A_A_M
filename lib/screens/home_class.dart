import 'package:firebase_auth/firebase_auth.dart';
import 'package:s_a_a_m/auth.dart';
import 'package:flutter/material.dart';
import 'package:s_a_a_m/components/navigation_drawer.dart';
import 'package:s_a_a_m/screens/classroom.dart';
import 'package:s_a_a_m/screens/create_class.dart';
//import 'package:s_a_a_m/screens/face_scan.dart';
import 'package:s_a_a_m/screens/join_class.dart';

class ClassesHome extends StatefulWidget {
   ClassesHome({super.key});
  // ignore: non_constant_identifier_names
  static String routeName= "ClassesHome";

  final User? user = Auth().currentUser;

  Future<void> signOut() async {
    await Auth().signOut();
  }

  @override
  State<ClassesHome> createState() => _ClassesHomeState();
}

class _ClassesHomeState extends State<ClassesHome> {
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

      floatingActionButton: SizedBox(
        width: 80,
        height: 80,
        child: FloatingActionButton(
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
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return JoinClassDialog();
                            },
                          );
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.person_outline),
                        title: const Text('Create a class'),
                        onTap: () {
                          Navigator.pop(context);
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return const CreateClassDialog();
                            },
                          );
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
            size: 45,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ClassRoom()));
                },
                child: Card(
                  elevation: 10,
                  color: Colors.blueGrey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Machine Learning',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Md. Rezaul Karim',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            size: 35,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            // Add your action here
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ClassRoom()));
                },
                child: Card(
                  elevation: 10,
                  color: Colors.blueGrey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Operating System',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Mosaddek Hossain Kamal',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            size: 35,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            // Add your action here
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ClassRoom()));
                },
                child: Card(
                  elevation: 10,
                  color: Colors.blueGrey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Algorithms',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Md. Ashraful Islam',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            size: 35,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            // Add your action here
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const ClassRoom()));
                },
                child: Card(
                  elevation: 10,
                  color: Colors.blueGrey[900],
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'PDS',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Colors.white),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Upoma Kabir',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.more_vert,
                            size: 35,
                          ),
                          color: Colors.white,
                          onPressed: () {
                            // Add your action here
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
