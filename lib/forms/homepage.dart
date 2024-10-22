// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:drop_down/CustomBar/customAppabr.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? SavedName;
  String? SavedEmail;
  String? SavedGender;
  List<String>? SavedCourses;
  int? SaveduserType;

  Future<void> _getSharedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      SavedName = prefs.getString('name') ?? 'No User Nane';
      SavedEmail = prefs.getString('email') ?? 'No user Email';
      SavedGender = prefs.getString('gender') ?? 'Gender Not Specified';
      SavedCourses = prefs.getStringList('courses') ?? [];
      SaveduserType = prefs.getInt('userType') ?? 0;
    });
  }

  @override
  void initState() {
    super.initState();
    _getSharedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Customappabr(title: "Home"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Shared Preferences",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text("User Name:  $SavedName"),
            Text("user Email:  $SavedEmail"),
            Text("Gender: $SavedGender"),
          ],
        ),
      ),
    );
  }
}
