import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:app/pages/data.dart';
import 'package:flutter/material.dart';
import'package:app/pages/display_data.dart';


class Display_Data extends StatefulWidget {
  final String name_dp;
  final String type;


  const Display_Data({super.key, required this.name_dp, required this.type});

  @override
  _Display_DataState createState() => _Display_DataState();
}

class _Display_DataState extends State<Display_Data> {
  Future<List<data>> getData() async {
    String jsonData = await DefaultAssetBundle.of(context)
        .loadString("assets/data/data.json");
    List<dynamic> jsonList = jsonDecode(jsonData);
    List<data> dataList =
        jsonList.map((item) => data.fromJson(item)).toList();
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
            //debugPrint(widget.name_dp);
            //debugPrint(widget.type);

              if (widget.name_dp == 'Ouest') {
                id = 1;
              } else if (widget.name_dp == 'Sud-Est') {
                id = 2;
              } else if (widget.name_dp == 'Nord') {
                id = 3;
              } else if (widget.name_dp == 'Nord-Est') {
                id = 4;
              } else if (widget.name_dp == 'Artibonite') {
                id = 5;
              } else if (widget.name_dp == 'Centre') {
                id = 6;
              } else if (widget.name_dp == 'Sud') {
                id = 7;
              } else if (widget.name_dp == 'GrandAnse') {
                id = 8;
              } else if (widget.name_dp == 'Nord-Ouest') {
                id = 9;
              } else if (widget.name_dp == 'Nippes') {
                id = 10;
              } else {
                id = -1; 
              }


            List<data> dataList = snapshot.data!.where((item) =>
              item.departementID == id &&
              item.type == widget.type).toList();

            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {

                return ListTile(
                  title: Text(
                  dataList[index].nom ?? '',
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
