import 'package:app/pages/places.dart';
import 'package:app/pages/register.dart';
import 'package:app/pages/states.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {

Widget button(String text){
  return Container(
    height: 50.0,
    width: 220.0,
    margin: const EdgeInsets.symmetric(horizontal: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 197, 67, 28),
      borderRadius: BorderRadius.circular(25.0),
      boxShadow: const [
        BoxShadow(
          color: Colors.black,
          blurRadius: 4.0,
          spreadRadius: 1.0, 
          offset: Offset(
            0.0,
            4.0,
          ),
        ),
      ]
      ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/haiti.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/chillHT.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 40),
            const Text(
              "You want to chill? Come discover beautiful places in Haiti with us!",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 120),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => States( title: 'bae', name: 'AllDepartement')),
                );
              },
              child: button("Discover")
            ),

            const SizedBox(height: 30),
            
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register(title: 'b')),
                );
              },
              child: button("Register a new place")
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
