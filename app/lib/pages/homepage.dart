import 'package:app/pages/places.dart';
import 'package:app/pages/register.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text(
          'Homepage',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: const Text(
                'Choose one of two options to navigate',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Places()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                textStyle: TextStyle(fontSize: 20),
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
              child: Text('Thing To Do'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Register()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(250, 50),
                textStyle: TextStyle(fontSize: 20),
                primary: Colors.white,
                onPrimary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(
                    color: Colors.white,
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
