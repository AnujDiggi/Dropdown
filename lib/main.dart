import 'package:drop_down/CustomBar/customAppabr.dart';
import 'package:drop_down/forms/applicationform.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Customappabr(title: "Application Form"),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [const Padding(
              padding:  EdgeInsets.all(10),
              child: Text("Welcome To Application Form", 
               style: TextStyle(
                 fontSize: 25,
                 fontWeight: FontWeight.bold
               ),
               
              ),
            ),
            ElevatedButton(onPressed: () {
               Navigator.push(context, MaterialPageRoute(builder: (context) => const Applicationform()));
            }, child: const Icon(Icons.login))
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 166, 173, 218),
    );
  }
}
