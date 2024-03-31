import 'package:flutter/material.dart';
import 'package:flutter_all/GlobalData.dart';

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
        title: const Text("View Data"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: GlobalData.lstperson.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(
                "Name : ${GlobalData.lstperson[index].name}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              subtitle: Text(
                "City : ${GlobalData.lstperson[index].city} ----- Pincode : ${GlobalData.lstperson[index].pincode}",
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrangeAccent,
                ),
              ),
              leading: const Icon(Icons.person),
              trailing: const Icon(Icons.card_giftcard),
              onTap: () {
                GlobalData.selectedIndex = index;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailView(),
                  ),
                ).then((value) {
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
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(650, 20, 0, 0),
        child: Column(
          children: [
            Text(
              "Name : ${GlobalData.lstperson[GlobalData.selectedIndex].name}",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            Text(
              "City : ${GlobalData.lstperson[GlobalData.selectedIndex].city}",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            Text(
              "Pincode : ${GlobalData.lstperson[GlobalData.selectedIndex].pincode}",
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
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
      ),
    );
  }
}
