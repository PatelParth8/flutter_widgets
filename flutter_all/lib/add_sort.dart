import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class _MyHomeState extends State<MyHome> {
  static List<int> lstMarks = [];
  String strValue = "";
  TextEditingController txtNum = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add-Sort-Remove-Max"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(200, 50, 200, 50),
        child: Column(
          children: [
            TextField(
              controller: txtNum,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "Enter Number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers_rounded),
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
                    int num = int.parse(txtNum.text.toString());
                    lstMarks.add(num);
                    txtNum.clear();

                    setState(() {
                      strValue = lstMarks.toString();
                    });
                  },
                  child: const Text("Add"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    lstMarks.sort();
                    setState(() {
                      strValue = lstMarks.toString();
                    });
                  },
                  child: const Text("Sort"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    lstMarks.removeAt(1);
                    setState(() {
                      strValue = lstMarks.toString();
                    });
                  },
                  child: const Text("Remove"),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    int max = 0;
                    for (int i = 0; i < lstMarks.length; i++) {
                      if (lstMarks[i] > max) {
                        max = lstMarks[i];
                        print(max);
                      }
                    }
                  },
                  child: const Text("Max"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text("Entered List is $strValue"),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListsWithCards(lstMarks: lstMarks),
                  ),
                );
              },
              child: const Text("Next page"),
            ),
          ],
        ),
      ),
    );
  }
}

// class NextPage extends StatelessWidget {
//   List<int> lstMarks = [];
//   NextPage({super.key, required this.lstMarks});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("Next Page"),
//           backgroundColor: Colors.blueGrey,
//         ),
//         body: CardList(lstMarks: lstMarks),
//       ),
//     );
//   }
// }

class ListsWithCards extends StatelessWidget {
  @override
  List<int> lstMarks = [];
  ListsWithCards({super.key, required this.lstMarks});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
          backgroundColor: Colors.blueGrey,
        ),
        body: CardList(lstMarks: lstMarks),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  List<int> lstMarks = [];
  CardList({required this.lstMarks});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          const ListTile(
            title: Text("The List View of Displaying Values in Card Format"),
            leading: Icon(Icons.star),
          ),
          const Divider(),
          ListView.builder(
            itemCount: lstMarks.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blueGrey,
                child: ListTile(
                  leading: const Icon(Icons.numbers),
                  title: Text(lstMarks[index].toString()),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              //Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHome(),
                ),
              );
            },
            child: const Text("Go Back"),
          ),
        ],
      ),
    );
  }
}


// class CardList extends StatelessWidget {
//   List<int> lstMarks = [];
//   CardList({required this.lstMarks});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(10.0),
//       child: Column(
//         children: [
//           const ListTile(
//             title: Text("List Display"),
//             leading: Icon(Icons.card_giftcard_rounded),
//           ),
//           const Divider(),
//           ListView.builder(
//             itemCount: lstMarks.length,
//             itemBuilder: (context, index) {
//               return Container(
//                 color: Colors.blueGrey,
//                 child: ListTile(
//                   title: Text(lstMarks[index].toString()),
//                   leading: const Icon(Icons.arrow_back_ios_new_outlined),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(
//             height: 40,
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text("Go Back"),
//           ),
//         ],
//       ),
//     );
//   }
// }
