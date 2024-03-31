// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_all/GlobalData.dart';
import 'package:flutter_all/ViewData.dart';

class Add extends StatelessWidget {
  const Add({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AddHome(),
    );
  }
}

class Person {
  String name, city;
  int pincode;
  Person({required this.name, required this.city, required this.pincode});
}

class AddHome extends StatefulWidget {
  const AddHome({super.key});

  @override
  State<AddHome> createState() => _AddHomeState();
}

class _AddHomeState extends State<AddHome> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController pinController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: "Enter Name",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: cityController,
            decoration: const InputDecoration(
              hintText: "Enter City",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.location_city),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: pinController,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              hintText: "Enter Pincode",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.pin),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              String name = nameController.text.toString();
              String city = cityController.text.toLowerCase();
              int pincode = int.parse(pinController.text.toString());

              GlobalData.lstperson.add(
                Person(name: name, city: city, pincode: pincode),
              );

              nameController.clear();
              cityController.clear();
              pinController.clear();
            },
            child: const Text("Submit"),
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              if (GlobalData.lstperson.isNotEmpty) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ViewData(),
                  ),
                );
              } else {
                print("List is Empty");
              }
            },
            child: const Text("View Data"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.coffee_maker_rounded,
        ),
      ),
    );
  }
}
