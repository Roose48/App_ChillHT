import 'dart:convert';

import 'package:app/pages/data.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/display_data.dart';

import 'description.dart';

class Display_Data extends StatefulWidget {
  final String deptName;
  final String type;

  const Display_Data({super.key, required this.deptName, required this.type});

  @override
  _Display_DataState createState() => _Display_DataState();
}

class _Display_DataState extends State<Display_Data> {
  
  Future<List<data>> getData() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString("assets/data/data.json");
    List<dynamic> jsonList = jsonDecode(jsonData);
    List<data> dataList = jsonList.map((item) => data.fromJson(item)).toList();
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
            //debugPrint(widget.deptName);
            //debugPrint(widget.type);

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
                    MaterialPageRoute(builder: (context) => Descrip_Data(place: dataList[index],)),
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
