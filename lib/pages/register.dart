import 'dart:io';
import 'package:app/pages/homepage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final _firestore = FirebaseFirestore.instance;
  XFile? file;
  String imageUrl = '';
  DatabaseReference? dbRef;

  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Places');
  }

  String email = '';
  String name = '';
  String desc = '';
  String city = '';
  String address = '';
  String selectedDept = 'Ouest';
  String selectedType = 'Restaurant';

  List<String> departements= [
    "Artibonite",
    "Centre",
    "Grand'Anse",
    "Nippes",
    "Nord",
    "Nord-Est",
    "Nord-Ouest",
    "Ouest",
    "Sud",
    "Sud-Est"
  ];

  List<String> types= [
    "Restaurant",
    "Hotel",
    "Museum",
    "Beach",
  ];

  Widget dropDownList(Widget child){
    return Expanded(
            child: Container(
              height: 55.0,
              width: MediaQuery.of(context).size.width/2,
              margin:  const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
              padding: const EdgeInsets.only(left: 15.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: child,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/citadelle.jpg"
                ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5.0,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homepage()),
                        );
                      }, 
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    Image.asset(
                      'assets/images/chillHT_logo.png',
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Text(
                      'Have a great experience\nwith us',
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0),
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(197, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: ListView(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: const InputDecoration(                  
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.mail,
                            color: Colors.deepOrange,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) => email = value,
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: businessNameController,
                        decoration: const InputDecoration(
                          hintText: 'Business Name',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.business,
                            color: Colors.deepOrange,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) => name = value,
                      ),
                      const SizedBox(height: 20.0),

                      Row(
                        children: [
                          const Icon(
                            Icons.restaurant_menu_outlined,
                            color: Colors.deepOrange,
                          ),
                          dropDownList(
                            DropdownButton<String>(
                            value: selectedType,
                            items: types.map((String type) {
                              return DropdownMenuItem<String>(
                                value: type,
                                child: Text(type),
                                
                              );
                            }).toSet().toList(), 
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedType = newValue!;
                              });
                            },
                          ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0),

                      Row(
                        children: [
                          const Icon(
                            Icons.add_location_alt_sharp,
                            color: Colors.deepOrange,
                          ),
                          dropDownList(
                            DropdownButton<String>(
                            value: selectedDept,
                            items: departements.map((String dept) {
                              return DropdownMenuItem<String>(
                                value: dept,
                                child: Text(dept),
                                
                              );
                            }).toSet().toList(), 
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedDept = newValue!;
                              });
                            },
                          ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20.0),
                      TextField(
                        controller: cityController,
                        decoration: const InputDecoration(
                          hintText: 'City',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.location_city,
                            color: Colors.deepOrange,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) => city = value,
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        controller: addressController,
                        decoration: const InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.deepOrange,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) => address = value,
                      ),
                      const SizedBox(height: 20.0),
                      TextField(
                        keyboardType: TextInputType.multiline,
                        controller: descriptionController,
                        decoration: const InputDecoration(
                          hintText: 'Description',
                          hintStyle: TextStyle(
                            color: Colors.black45,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          icon: Icon(
                            Icons.text_decrease_outlined,
                            color: Colors.deepOrange,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (value) => desc = value,
                      ),
                      const SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          '${file?.name}',
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                          onTap: () async{
                            try{
                              // Pick image from gallery
                              ImagePicker imagePicker = ImagePicker();
                              file = await imagePicker.pickImage(source: ImageSource.gallery);
                            
                            } on Exception catch (e) {
                              print(e);
                            }
                          },
                          child: Container(
                            height: 50.0,
                            margin: const EdgeInsets.symmetric(horizontal: 50),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 239, 114, 37),
                                borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: const [
                                Icon(
                                  Icons.upload,
                                  color: Colors.white,
                                ),
                                Text(
                                'Upload Image',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                            ),
                          ),
                      ),
                      const SizedBox(height: 20.0),
                      GestureDetector(
                        onTap: () async {
                          
                          // Get reference to firebase storage root
                          Reference referenceRoot = FirebaseStorage.instance.ref();
                          Reference referenceImages = referenceRoot.child('images');

                          //Create reference for the image to be stored
                          Reference referenceImageUpload = referenceImages.child('${file?.name}');


                          // Handle error/success
                          try{
                            // Store image file
                            await referenceImageUpload.putFile(File(file!.path));
                            //Success: get url
                            imageUrl = await referenceImageUpload.getDownloadURL();
                          }catch(error){
                            print(error);
                          }

                          
                          if(imageUrl.isEmpty){
                            ScaffoldMessenger.of(context)
                              .showSnackBar(
                                const SnackBar(
                                  content: Text('Please upload an image')
                                )
                            );
                          }

                          // Implement firebase registration connection here
                          _firestore.collection('places').add({
                            'email': email,
                            'name': name,
                            'type': selectedType,
                            'dept': selectedDept,
                            'description': desc,
                            'city': city,
                            'address': address,
                            'image': imageUrl,
                          });

                        },
                        child: Container(
                          height: 50.0,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 239, 114, 37),
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black87,
                                  blurRadius: 4.0,
                                  spreadRadius: 2.0,
                                ),
                              ]
                              ),
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
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