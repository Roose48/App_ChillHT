import 'package:app/pages/homepage.dart';
import 'package:app/pages/states.dart';
import 'package:flutter/material.dart';


class Places extends StatelessWidget {
  const Places({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Find Thing To Do",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildButton(context, 'hotel', Icons.hotel, Colors.blue,
              ),
            SizedBox(height:40),

            buildButton(context, 'Restaurant', Icons.restaurant, Colors.blue),
            SizedBox(height: 40),

            buildButton(context, 'Museum', Icons.museum, Colors.blue),
            SizedBox(height: 40),

            buildButton(context, 'Beach', Icons.beach_access, Colors.blue),
          ],
        ),
      ),
    );
  }

  Widget buildButton(
      BuildContext context, String text, IconData iconData, Color color) {
    return GestureDetector(
       onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => States(title: "bb")),
      ),
  
      child: Container(
        width: 150.0,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0.0, 20.0),
                  blurRadius: 30.0,
                  color: Colors.black)
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(22.0)),
        child: Row(children: <Widget>[
          Container(
            height: 50.0,
            width: 110.0,
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(95.0),
                    topLeft: Radius.circular(95.0),
                    bottomRight: Radius.circular(200.0))),
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.apply(color: Colors.black),
            ),
          ),
          Icon(
            iconData,
            size: 30.0,
          )
        ]),
      ),
    );
  }
}





      
    
  


