import 'package:app/pages/display_data.dart';
import 'package:app/pages/homepage.dart';
import 'package:app/pages/states.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/description.dart';


class Places extends StatelessWidget {
  final String name;

  const Places({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        
        title: Text(
          name,
          
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: Colors.white ),
        
        ),
      ),
      
      body: Container(
        color: Colors.black,
        child:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            buildButton(context, 'Hotel', Icons.hotel, Color.fromARGB(255, 233, 66, 16), 'Hotel'
              ),
            const SizedBox(height:40),

            buildButton(context, 'Restaurant', Icons.restaurant, Color.fromARGB(255, 233, 66, 16), 'Restaurant'),
            const SizedBox(height: 40),

            buildButton(context, 'Museum', Icons.museum, const Color.fromARGB(255, 233, 66, 16),'Museum'),
            const SizedBox(height: 40),

            buildButton(context, 'Beach', Icons.beach_access, const Color.fromARGB(255, 233, 66, 16),'Beach'),
          ],
        ),
      ),
      )
    );
  }

  Widget buildButton(
      BuildContext context, String text, IconData iconData, Color color, String type) {
    return GestureDetector(
       onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Display_Data(name_dp: name, type: type ,)),
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





      
    
  


