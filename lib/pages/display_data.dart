import 'dart:convert';

import 'package:app/components/departements.dart';
import 'package:app/pages/data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// class ItemList extends StatelessWidget {
//   ItemList({
//     Key? key,
//     required String deptName,
//     required String type,
//   }) : super(key: key) {
//     _stream = _reference.snapshots();
//   }

//   final CollectionReference _reference = FirebaseFirestore.instance.collection('places');

//   List<data> dataList = [];

// //   placesRef.get().then((QuerySnapshot querySnapshot) {
// //   querySnapshot.docs.forEach((doc) {
// //     data newData = data.fromJson(doc.data());
// //     dataList.add(newData);
// //   });
// // });

//   late Stream<QuerySnapshot> _stream;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Items'),
//       ),
//       body: StreamBuilder<QuerySnapshot>(
//         stream: _stream,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           if (snapshot.hasError) {
//             return Center(child: Text('Some error occurred ${snapshot.error}'));
//           }

//           if (snapshot.hasData) {
//             QuerySnapshot querySnapshot = snapshot.data;
//             List<QueryDocumentSnapshot> documents = querySnapshot.docs;
//             List<Map> items = documents.map((e) => e.data() as Map).toList();

//               // debugPrint(element['image']);

//             return ListView.builder(
//                 itemCount: items.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   //Get the item at this index
//                   Map thisItem = items[index];
//                   //REturn the widget for the list items
//                   return ListTile(
//                     title: Text('${thisItem['name']}'),
//                     //subtitle: Text('${thisItem['dept']}'),
//                     leading: Container(
//                       height: 100,
//                       width: 100,
//                       // child: thisItem.containsKey('image') ? Image.network(
//                       // '${thisItem['image']}') : Container(),
//                     ),
//                   );
//                 });
//           }

//           //Show loader
//           return Center(child: CircularProgressIndicator());
//         },
//       ), //Display a list // Add a FutureBuilder
//       //floatingActionButton: FloatingActionButton(
//       // onPressed: () {
//       //   Navigator.of(context)
//       //       .push(MaterialPageRoute(builder: (context) => AddItem()));
//       // },
//       // tooltip: 'Increment',
//       //child: const Icon(Icons.add),
//       // ),
//     );
//   }
// }

import 'dart:convert';

import 'package:app/pages/data.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/display_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'description.dart';

class Display_Data extends StatefulWidget {
  final String deptName;
  final String type;

  const Display_Data({super.key, required this.deptName, required this.type});

  @override
  _Display_DataState createState() => _Display_DataState();
}

class _Display_DataState extends State<Display_Data> {
  final CollectionReference placesRef =
      FirebaseFirestore.instance.collection('places');

  Future<List<data>> getData() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString("assets/data/data.json");
    List<dynamic> jsonList = jsonDecode(jsonData);
    List<data> dataList = jsonList.map((item) => data.fromJson(item)).toList();

    QuerySnapshot querySnapshot = await placesRef.get();
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> element = doc.data() as Map<String, dynamic>;
      int deptid;
      if (element['dept'] == 'Ouest') {
        deptid = 1;
      } else if (element['dept'] == 'Sud-Est') {
        deptid = 2;
      } else if (element['dept'] == 'Nord') {
        deptid = 3;
      } else if (element['dept'] == 'Nord-Est') {
        deptid = 4;
      } else if (element['dept'] == 'Artibonite') {
        deptid = 5;
      } else if (element['dept'] == 'Centre') {
        deptid = 6;
      } else if (element['dept'] == 'Sud') {
        deptid = 7;
      } else if (element['dept'] == 'GrandAnse') {
        deptid = 8;
      } else if (element['dept'] == 'Nord-Ouest') {
        deptid = 9;
      } else if (element['dept'] == 'Nippes') {
        deptid = 10;
      } else {
        deptid = -1;
      }

      data newdata = data(
        iD: 100,
        departementID: deptid,
        type: element['type'],
        nom: element['name'],
        adress: element['address'],
        images: element['image'],
        description: element['description'],
      );
      dataList.add(newdata);
    });

    return dataList;
  }

  @override
  void initState() {
    super.initState();
  }

  late int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<data>>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (widget.deptName == 'Ouest') {
              id = 1;
            } else if (widget.deptName == 'Sud-Est') {
              id = 2;
            } else if (widget.deptName == 'Nord') {
              id = 3;
            } else if (widget.deptName == 'Nord-Est') {
              id = 4;
            } else if (widget.deptName == 'Artibonite') {
              id = 5;
            } else if (widget.deptName == 'Centre') {
              id = 6;
            } else if (widget.deptName == 'Sud') {
              id = 7;
            } else if (widget.deptName == 'GrandAnse') {
              id = 8;
            } else if (widget.deptName == 'Nord-Ouest') {
              id = 9;
            } else if (widget.deptName == 'Nippes') {
              id = 10;
            } else {
              id = -1;
            }

            List<data> dataList = snapshot.data!
                .where((item) =>
                    item.departementID == id && item.type == widget.type)
                .toList();

            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    dataList[index].nom ?? '',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Descrip_Data(
                              place: dataList[index],
                            )),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
