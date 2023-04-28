import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();

  Register({super.key, required String title});

  final _firestore = FirebaseFirestore.instance;

  String email = '';
  String name = '';
  String state = '';
  String city = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         // backgroundColor: Colors.black,
        appBar: AppBar(
          title: const Text('Login your Business'),
          backgroundColor: Colors.black,
        ),

        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(                  
                  labelText: 'Email',
                ),
                onChanged: (value) => email = value,
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: businessNameController,
                decoration: const InputDecoration(
                  labelText: 'Business Name',
                ),
                onChanged: (value) => name = value,
              ),
              const SizedBox(height: 10.0),
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'City',
                ),
                onChanged: (value) => city = value,
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
                onChanged: (value) => address = value,
              ),



              const SizedBox(height: 16.0),
              TextField(
                controller: departmentController,
                decoration: const InputDecoration(
                  labelText: 'Department',
                ),
                onChanged: (value) => state = value,
              ),

    
              const Spacer(), 
              ElevatedButton(
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(type: FileType.image);

                  if (result != null) {
                    File file = File(result.files.single.path!);
                    // Do something with the selected image file
                  }
                },
                child: Text('Upload Image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 233, 66, 16),
                 shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
    ),
  ),
              ),



              Spacer(), // Ajout d'un Spacer pour pousser le bouton vers le bas
              ElevatedButton(
                onPressed: () {
                  // Implement firebase registration connection here
                  _firestore.collection('places').add({
                    'email': email,
                    'place_name': name,
                    'state': state,
                    'city': city,
                    'addresse': address,
                  });
                },
                child: Text('Register'),
                style: ElevatedButton.styleFrom(
                  
                 shape: CircleBorder(), // Utilisation de CircleBorder pour faire le bouton en forme de cercle
                 padding: EdgeInsets.all(0), // Suppression de l'espacement interne pour que le cercle occupe toute la place disponible
                 minimumSize: Size(60, 80), // Définition de la largeur et de la hauteur pour qu'elles soient égales
                 backgroundColor: Color.fromARGB(255, 233, 66, 16),
 // Couleur de fond du cercle
                 elevation: 3, 
                ),
              ),
            ],
          ),
        ),
    );
  }
}
