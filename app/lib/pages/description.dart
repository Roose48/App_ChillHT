// TODO Implement this library.
import 'package:flutter/material.dart';


class Description extends StatelessWidget {
  const Description({super.key, required name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,        
        title:  Title(
          color: Colors.black,
           child: Text('child'))
        ),
      );
    
  }
}