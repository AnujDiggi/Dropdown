// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names

import 'package:drop_down/CustomBar/customAppabr.dart';
import 'package:drop_down/forms/homepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Applicationform extends StatefulWidget {
  const Applicationform({super.key});

  @override
  _ApplicationformState createState() => _ApplicationformState();
}

class _ApplicationformState extends State<Applicationform> {
  var formKey = GlobalKey<FormState>();

  String gender = 'Select';

  var genders = ['Male', 'Female', 'None'];

  bool? value = false;

  Map<String, bool> selectedCourses = {
    'MCA': false,
    'BCA': false,
    'MBA': false,
    'BBA': false,
  };

  int selectedvalue = 0;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadUserdata();
  }

  Future<void> saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('name', namecontroller.text);
    await prefs.setString('email', emailController.text);
    await prefs.setString('gender', gender);
    await prefs.setInt('userType', selectedvalue);

    String selectedCoursesString = selectedCourses.keys
        .where((course) => selectedCourses[course] == true)
        .join(',');
    await prefs.setString('courses', selectedCoursesString);
  }

  Future<void> loadUserdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namecontroller.text = prefs.getString('name') ?? ' ';
    emailController.text = prefs.getString('email') ?? ' ';
    gender = prefs.getString('gender') ?? ' ';
    selectedvalue = prefs.getInt('userType') ?? 0;

    String? SavedCourses = prefs.getString('courses');
    if (SavedCourses != null) {
      List<String> savedCoursesList = SavedCourses.split(',');
      selectedCourses.updateAll(
        (key, value) => savedCoursesList.contains(key),
      );
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Customappabr(title: "Application Form"),
      body: Center(
          child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          "Application Form",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: namecontroller,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Enter Your Name"),
                              hintText: 'Your Name'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Your Name";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text("Enter Your Email"),
                              hintText: "Your Email"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter Your Email";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DropdownMenu(
                          initialSelection: 'Gender',
                          onSelected: (String? value) {
                            setState(() {
                              gender = value!;
                            });
                          },
                          dropdownMenuEntries: genders.map((String value) {
                            return DropdownMenuEntry(
                                value: value, label: value);
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Courses",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: selectedCourses.keys.map((String course) {
                            return Column(
                              children: [
                                CheckboxListTile(
                                    tristate: true,
                                    title: Text(course),
                                    value: selectedCourses[course],
                                    onChanged: (bool? newValue) {
                                      setState(() {
                                        selectedCourses[course] = newValue!;
                                      });
                                    }),
                              ],
                            );
                          }).toList(),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: const BoxDecoration(color: Colors.grey),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("User type"),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  RadioListTile(
                                      title: const Text("Admin"),
                                      value: 1,
                                      groupValue: selectedvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedvalue = value!;
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("User"),
                                      value: 2,
                                      groupValue: selectedvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedvalue = value!;
                                        });
                                      }),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RadioListTile(
                                      title: const Text("Hotelier"),
                                      value: 3,
                                      groupValue: selectedvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedvalue = value!;
                                        });
                                      }),
                                  RadioListTile(
                                      title: const Text("consumer"),
                                      value: 4,
                                      groupValue: selectedvalue,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedvalue = value!;
                                        });
                                      }),
                                ],
                              )
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              if (formKey.currentContext != null &&
                                  formKey.currentState!.validate()) {
                                saveUserData();
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Homepage()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange),
                            child: const Icon(
                              Icons.done,
                              color: Colors.white,
                              size: 25,
                            ))
                      ],
                    ),
                  ),
                ),
              ))),
    );
  }
}
