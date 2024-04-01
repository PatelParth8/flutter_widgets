// ignore_for_file: unnecessary_new

import 'package:flutter_basic/GlobalData.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/DetailView.dart';

void main() {
  runApp(MyApp());
}

class Person {
  String name = "";
  String email = "";
  int pincode = 0;
  Person({required this.name, required this.email, required this.pincode});
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: myHome(),
    );
  }
}

class myHome extends StatefulWidget {
  const myHome({Key? key}) : super(key: key);

  @override
  State<myHome> createState() => _myHomeState();
}

class _myHomeState extends State<myHome> {
  TextEditingController txtName = new TextEditingController();
  TextEditingController txtEmail = new TextEditingController();
  TextEditingController txtPincode = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter"),
        backgroundColor: Colors.blueGrey,
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
              keyboardType: TextInputType.number,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      String name = txtName.text.toString();
                      String email = txtEmail.text.toString();
                      int pincode = int.parse(txtPincode.text.toString());

                      GlobalData.lstperson.add(
                        Person(name: name, email: email, pincode: pincode),
                      );

                      txtName.clear();
                      txtEmail.clear();
                      txtPincode.clear();
                    },
                    child: const Text("Add")),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      if (GlobalData.lstperson.isNotEmpty) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ViewData()));
                      } else {
                        print("List is Empty.....!");
                      }
                    },
                    child: Text("View All")),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.call,
        ),
      ),
    );
  }
}
