import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


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
  final TextEditingController departmentController = TextEditingController();

  final _firestore = FirebaseFirestore.instance;

  String email = '';
  String name = '';
  String state = '';
  String city = '';
  String address = '';

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
                      height: 20.0,
                    ),
                    Image.asset(
                      'assets/images/chillHT_logo.png',
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(
                      height: 20.0,
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
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(197, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: ListView(
                    children: [
                      const SizedBox(
                      height: 20.0,
                      ),
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
              ),
            ],
            ),
          ),        
        ),
    );
  }
}

// Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextField(
//                 controller: emailController,
//                 decoration: const InputDecoration(                  
//                   labelText: 'Email',
//                 ),
//                 onChanged: (value) => email = value,
//               ),
//               const SizedBox(height: 10.0),
//               TextField(
//                 controller: businessNameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Business Name',
//                 ),
//                 onChanged: (value) => name = value,
//               ),
//               const SizedBox(height: 10.0),
//               TextField(
//                 controller: cityController,
//                 decoration: const InputDecoration(
//                   labelText: 'City',
//                 ),
//                 onChanged: (value) => city = value,
//               ),
//               const SizedBox(height: 16.0),
//               TextField(
//                 controller: addressController,
//                 decoration: const InputDecoration(
//                   labelText: 'Address',
//                 ),
//                 onChanged: (value) => address = value,
//               ),



//               const SizedBox(height: 16.0),
//               TextField(
//                 controller: departmentController,
//                 decoration: const InputDecoration(
//                   labelText: 'Department',
//                 ),
//                 onChanged: (value) => state = value,
//               ),

    
//               const Spacer(), 
//               ElevatedButton(
//                 onPressed: () async {
//                   FilePickerResult? result =
//                       await FilePicker.platform.pickFiles(type: FileType.image);

//                   if (result != null) {
//                     File file = File(result.files.single.path!);
//                     // Do something with the selected image file
//                   }
//                 },
//                 child: Text('Upload Image'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color.fromARGB(255, 233, 66, 16),
//                  shape: RoundedRectangleBorder(
//                  borderRadius: BorderRadius.circular(10),
//     ),
//   ),
//               ),



//               Spacer(), // Ajout d'un Spacer pour pousser le bouton vers le bas
//               ElevatedButton(
//                 onPressed: () {
//                   // Implement firebase registration connection here
//                   _firestore.collection('places').add({
//                     'email': email,
//                     'place_name': name,
//                     'state': state,
//                     'city': city,
//                     'addresse': address,
//                   });
//                 },
//                 child: Text('Register'),
//                 style: ElevatedButton.styleFrom(
                  
//                  shape: CircleBorder(), // Utilisation de CircleBorder pour faire le bouton en forme de cercle
//                  padding: EdgeInsets.all(0), // Suppression de l'espacement interne pour que le cercle occupe toute la place disponible
//                  minimumSize: Size(60, 80), // Définition de la largeur et de la hauteur pour qu'elles soient égales
//                  backgroundColor: Color.fromARGB(255, 233, 66, 16),
//  // Couleur de fond du cercle
//                  elevation: 3, 
//                 ),
//               ),
//             ],
//           ),
//         ),