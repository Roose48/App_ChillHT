import 'dart:convert';

import 'package:app/pages/data.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/display_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'description.dart';

class PlacesList extends StatelessWidget {
  String dept, type;
  PlacesList({Key? key, required this.dept, required this.type}) : super(key: key) {
  _stream = _reference.snapshots();
  }

  final CollectionReference _reference = FirebaseFirestore.instance.collection('places');
  
  
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          // Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            List<Map> items = documents.map((e) => e.data() as Map).toList();

            //Filter specific data
            var filtering = items.where((map) => map['dept'] == dept && map['type'] == type ).toList();

            //Display the list
            return ListView.builder(
                itemCount: filtering.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = filtering[index];

                    //Return the widget for the list items
                    return ListTile(
                      title: Text('${thisItem['name']}'),
                      subtitle: Text('${thisItem['type']}'),
                      leading: Container(
                        height: 80,
                        width: 80,
                        // child: thisItem.containsKey('image') ? Image.network(
                        //   '${thisItem['image']}') : Container(), 
                      ),
                      onTap: () {}
                    );

                    
                });
          }

          //Show loader
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}