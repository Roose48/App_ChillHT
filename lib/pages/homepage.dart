import 'package:app/pages/places.dart';
import 'package:app/pages/register.dart';
import 'package:app/pages/states.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              "You want to chill? Discover beautiful places in Haiti with us!",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => States( title: 'bae', name: 'AllDepartement')),
                );
              },
              child: Container(
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
                child: const Text(
                  "Discover",
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  Register(title: 'AllDepartement',)),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                textStyle: TextStyle(fontSize: 20),
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Colors.deepOrange,
                    width: 2,
                  ),
                ),
              ),
              child: Text('Get Infos'),
            ),
          ],
        ),
      ),
    );
  }
}
