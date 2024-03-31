// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class AllWidgets extends StatelessWidget {
  const AllWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

enum enumGender { male, female, other }

class _MyHomeState extends State<MyHome> {
  bool valueCheck = false;
  bool valueSwitch = false;
  double valueSlider = 20;
  enumGender? _character = enumGender.male;

  TimeOfDay _time = TimeOfDay(hour: 00, minute: 00);
  TextEditingController timeController = new TextEditingController();

  DateTime currentDate = DateTime.now();
  TextEditingController dateController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Widgets"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Checkbox(
            value: valueCheck,
            activeColor: Colors.orange,
            checkColor: Colors.yellow,
            onChanged: (bool? value) {
              setState(() {
                this.valueCheck = value!;
              });
            },
          ),
          Switch(
            value: valueSwitch,
            onChanged: (value) {
              valueSwitch = value;
              setState(() {});
            },
          ),
          Slider(
            value: valueSlider,
            onChanged: (value) {
              valueSlider = value;
              setState(() {});
            },
            min: 0,
            max: 100,
            activeColor: Colors.amberAccent,
            inactiveColor: Colors.redAccent,
            divisions: 10,
            thumbColor: Colors.black,
          ),
          ListTile(
            title: const Text("Male"),
            leading: Radio<enumGender>(
              value: enumGender.male,
              groupValue: _character,
              onChanged: (enumGender? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text("Female"),
            leading: Radio<enumGender>(
              value: enumGender.female,
              groupValue: _character,
              onChanged: (enumGender? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text("Other"),
            leading: Radio<enumGender>(
              value: enumGender.other,
              groupValue: _character,
              onChanged: (enumGender? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          TextField(
            controller: dateController,
            decoration: const InputDecoration(
              hintText: "Enter Date",
              prefixIcon: Icon(Icons.calendar_month),
            ),
            readOnly: true,
            onTap: () async {
              DateTime? pickeDate = await showDatePicker(
                context: context,
                firstDate: DateTime(2000),
                lastDate: DateTime(2050),
              );
              if (pickeDate != null) {
                print(pickeDate);
                String formattedDate = pickeDate.toString();
                formattedDate = formattedDate.substring(0, 10);
                dateController.text = formattedDate;
              } else {
                print("Date Not Selected");
              }
            },
          ),
          TextField(
            controller: timeController,
            decoration: const InputDecoration(
                hintText: "Enter Time", prefixIcon: Icon(Icons.timer)),
            readOnly: true,
            onTap: () async {
              TimeOfDay? newTime = await showTimePicker(
                context: context,
                initialTime: _time,
              );
              if (newTime != null) {
                print(newTime);
                String formattedTime = newTime.toString();
                formattedTime = formattedTime.substring(10, 15);
                timeController.text = formattedTime;
              } else {
                print("Time not Selected");
              }
            },
          ),
          Text("Check Box Value : ${valueCheck}"),
          Text("Switch Value : ${valueSwitch}"),
          Text("Slider Value : ${valueSlider.toInt()}"),
          Text("Selected Gender : ${_character}"),
          // Text("Selected Date : ${currentDate}"),
          // Text("Selected Time : ${newTime}"),
        ],
      ),
    );
  }
}
