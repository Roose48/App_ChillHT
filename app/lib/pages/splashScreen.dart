import 'package:flutter/material.dart';
import 'dart:ffi';
import 'package:app/pages/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, required String title});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatehome();
  }
  

  void _navigatehome() async {
  await Future.delayed(const Duration (milliseconds: 3000), () {});
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
    context,
     MaterialPageRoute(
      builder: (context) => Homepage (
        //title:  'chillHT',
      )));

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container( 
              color: Colors.black,
              child: Image.asset(
            'assets/images/chillHT.png',
            width: 100,
            height: 100,
              )
            ),

       

      Container(
        child: const Text(
          'Splash screen' , 
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
         ],
        ),
      ),
      );
  }
}
