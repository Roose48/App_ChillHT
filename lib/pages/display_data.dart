import 'package:app/pages/description.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PlacesList extends StatelessWidget {
  String dept, type, imagePath;
  PlacesList({Key? key, required this.dept, required this.type, required this.imagePath}) : super(key: key) {
  _stream = _reference.snapshots();
  }

  final CollectionReference _reference = FirebaseFirestore.instance.collection('places');
  
  
  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                imagePath
                ),
              fit: BoxFit.cover,
            ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 15.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 50.0),
                child: ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                      colors: [
                        Color.fromARGB(255, 0, 81, 232), 
                        Color.fromARGB(255, 222, 0, 0)
                      ],
                    ).createShader(bounds),
                    child: Text(
                      type,
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                
              ),
              
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: StreamBuilder<QuerySnapshot>(
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
                                  title: Text(
                                    '${thisItem['name']}',
                                    style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black87
                                    ),
                                  ),
                                  subtitle: Text(
                                    '${thisItem['city']}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black87
                                    ),
                                  ),
                                  leading: Container(
                                    height: 100,
                                    width: 100,
                                    child: thisItem.containsKey('image') ? Image.network(
                                      '${thisItem['image']}') : Container(), 
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Description(
                                          name: thisItem['name'],
                                          email: thisItem['email'],
                                          city: thisItem['city'],
                                          addresse: thisItem['address'],
                                          description: thisItem['description'],
                                          imagePath: thisItem['image'],
                                        )
                                      ),
                                    );
                                  }
                                );

                                
                            });
                      }

                      //Show loader
                      return const Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}