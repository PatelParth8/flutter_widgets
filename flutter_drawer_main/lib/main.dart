// ignore_for_file: unnecessary_new, must_be_immutable

import 'package:flutter_drawer_main/GlobalData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_drawer_main/DetailView.dart';
import 'package:flutter_drawer_main/Search.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class Person {
  String name = "";
  String email = "";
  int pincode = 0;
  Person({required this.name, required this.email, required this.pincode});
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController txtName = new TextEditingController();

  TextEditingController txtEmail = new TextEditingController();

  TextEditingController txtPincode = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Drawer'),
        backgroundColor: Colors.blueGrey,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text("Detail View"),
              leading: const Icon(Icons.smart_display),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabPage2()));
              },
            ),
            ListTile(
              title: const Text("Search"),
              leading: const Icon(Icons.search),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TabPage3()));
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: txtName,
              decoration: const InputDecoration(
                hintText: "Enter Your Name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.person,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtEmail,
              decoration: const InputDecoration(
                hintText: "Enter Your Email",
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.location_city,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: txtPincode,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Enter Pincode",
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.numbers,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                String name = txtName.text;
                String email = txtEmail.text;
                int pincode = int.parse(txtPincode.text.toString());

                GlobalData.lstperson
                    .add(Person(name: name, email: email, pincode: pincode));

                txtName.clear();
                txtEmail.clear();
                txtPincode.clear();
              },
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
