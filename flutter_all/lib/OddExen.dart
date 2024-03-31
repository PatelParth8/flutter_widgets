// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_all/main.dart';

class MyAppp extends StatelessWidget {
  const MyAppp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OddEvenHome(),
    );
  }
}

class OddEvenHome extends StatefulWidget {
  const OddEvenHome({super.key});

  @override
  State<OddEvenHome> createState() => _OddEvenHomeState();
}

class _OddEvenHomeState extends State<OddEvenHome> {
  TextEditingController OddEven = new TextEditingController();
  String result = "";
  int num = 0;

  void func() {
    num = int.parse(OddEven.text);

    setState(() {
      if (num % 2 == 0) {
        result = "Even Number";
      } else {
        result = "Odd Number";
      }
    });

    OddEven.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Odd Even"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(200, 20, 200, 0),
        child: Column(
          children: [
            TextField(
              controller: OddEven,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Enter Number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.code_off_rounded),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: func,
              child: const Text("Submit"),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(result),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextPage(num: num, result: result),
                  ),
                );
              },
              child: const Text("Next Page"),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  int num;
  String result;
  NextPage({super.key, required this.num, required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display Page"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(500, 20, 0, 0),
        child: Column(
          children: [
            Text("Entered Number is $num and is an $result"),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"),
            ),
          ],
        ),
      ),
    );
  }
}
