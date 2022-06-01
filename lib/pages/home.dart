import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../notificationservice.dart';
import 'login.dart';
import 'package:timezone/data/latest.dart' as tz;


class Home extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    tz.initializeTimeZones();
  }
  String uid = "";
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Home'),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text('Welcome to Geminos Group',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.indigo),textAlign: TextAlign.center,),
             
             
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.indigo,
                  ),
                   height: 50,
                      width: 250,
                      
                  child: TextButton(onPressed: ()=>NotificationService().showNotification(1, "GeminosApp", "Welcome to Geminos", 1), child: Text(
                          "Show Notification",style: TextStyle(color: Colors.white),
                        ),)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.logout),
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();
                      // ignore: use_build_context_synchronously
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}