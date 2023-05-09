import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/data.dart';

class FirestoreImageDisplay extends StatefulWidget {
  final data place;

  const FirestoreImageDisplay({Key? key, required this.place}) : super(key: key);

  @override
  _FirestoreImageDisplayState createState() => _FirestoreImageDisplayState();
}

class _FirestoreImageDisplayState extends State<FirestoreImageDisplay> {
  late String imageUrl;
  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    // // Set the initial value of imageUrl to an empty string
    // imageUrl = '';
    // //Retrieve the image from Firebase Storage
    // getImageUrl();

              debugPrint(widget.place.images.toString());

  }

  // Future<void> getImageUrl() async {
  //   // Get the reference to the image file in Firebase Storage
  //   final ref = storage.ref().child(widget.place.images.toString());
    
  //   // Get the imageUrl to download URL
  //   final url = await ref.getDownloadURL();
   
  //   setState(() {
  //     imageUrl = url;
     
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display image from Firebase"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Image.network(
              widget.place.images.toString(),
              fit: BoxFit.cover,
            ),
          ),
          
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class Descrip_Data extends StatefulWidget {
  final data place;

  const Descrip_Data({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _Descrip_DataState createState() => _Descrip_DataState();
}





class firebaseImages extends StatefulWidget{
  firebaseImages({super.key});
  @override
  State<firebaseImages> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<firebaseImages> {
  late String imageUrl;
  final storage = FirebaseStorage.instance;

  @override
  void initState() {
    super.initState();
    imageUrl = '';
    getImageUrl();
  }
   Future<void> getImageUrl() async {
    final ref = storage.ref().child('Anse Azur.png');
    final url = await ref.getDownloadURL();
    setState(() {
      imageUrl = url;
    });
  }

  
  
  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
      ),
      body: Column(
        children: [
          SizedBox(
              height: 300,
              child: Image(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              )),
          
        ],
      ),
    );
  }
  }
  
 


// ignore: camel_case_types
class _Descrip_DataState extends State<Descrip_Data> {


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
                          '${widget.place.images}', width: 100,height: 500,),
          
            Text(widget.place.nom.toString()),
            Text(widget.place.adress.toString()),
            Text(widget.place.description.toString()),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  //InkWell(
                     // onTap: ,
                      //child: Icon(Icons.favorite_border),
                   // ),

                  Icon(Icons.share),
                  Icon(Icons.near_me),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}

void saveEvent() {

}
