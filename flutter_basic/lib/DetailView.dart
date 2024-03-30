import 'package:flutter/material.dart';
import 'package:flutter_basic/GlobalData.dart';

class ViewData extends StatefulWidget {
  const ViewData({super.key});

  @override
  State<ViewData> createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail View"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: GlobalData.lstperson.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                "Name: ${GlobalData.lstperson[index].name}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
              subtitle: Text(
                "Email: ${GlobalData.lstperson[index].email} ------ Pincode: ${GlobalData.lstperson[index].pincode}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                  color: Colors.indigo,
                ),
              ),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.add_card),
              onTap: () {
                GlobalData.selectedIndex = index;
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return const DetailView();
                  },
                )).then((value) {
                  setState(() {});
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class DetailView extends StatelessWidget {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail View"),
      ),
      body: Column(
        children: [
          Text(
            GlobalData.lstperson[GlobalData.selectedIndex].name,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
            ),
          ),
          Text(
            GlobalData.lstperson[GlobalData.selectedIndex].email,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
            ),
          ),
          Text(
            GlobalData.lstperson[GlobalData.selectedIndex].pincode.toString(),
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blueAccent,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              GlobalData.lstperson.removeAt(GlobalData.selectedIndex);
              Navigator.pop(context);
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
