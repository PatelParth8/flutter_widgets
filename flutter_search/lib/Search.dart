import 'package:flutter/material.dart';
import 'package:flutter_search/GlobalData.dart';

class TabPage3 extends StatefulWidget {
  const TabPage3({super.key});

  @override
  State<TabPage3> createState() => _TabPage3State();
}

class _TabPage3State extends State<TabPage3> {
  String name = "";
  //String name = "";
  String email = "";
  int pincode = 0;

  TextEditingController txtName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
            controller: txtName,
            decoration: const InputDecoration(
              hintText: "Enter the Name",
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.person_2),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              for (int i = 0; i < GlobalData.lstperson.length; i++) {
                if (GlobalData.lstperson[i].name == txtName.text) {
                  print(GlobalData.lstperson[i].name);
                  name = GlobalData.lstperson[i].name;
                  email = GlobalData.lstperson[i].email;
                  pincode = GlobalData.lstperson[i].pincode;
                }
              }
              setState(() {});
            },
            child: const Text("Search"),
          ),
          Text(
              "Student Name : ${name} has Email ID : ${email} and Pincode is : ${pincode}")
        ],
      ),
    );
  }
}
