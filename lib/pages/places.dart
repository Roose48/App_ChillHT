import 'package:app/pages/display_data.dart';
import 'package:app/pages/states.dart';
import 'package:flutter/material.dart';


class Places extends StatelessWidget {
  final String name;
  final String imagePath;

  const Places({super.key, required this.name, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                imagePath
                ),
              fit: BoxFit.cover,
            ),
        ),
        child:SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 200.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => States()),
                    );
                  }, 
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0),
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                      ),

                      const SizedBox(
                        height: 30.0,
                      ),

                      buildButton(
                        context, 
                        'Hotel', 
                        Icons.hotel,
                        'Hotel'
                      ),

                      const SizedBox(
                        height: 5
                      ),

                      buildButton(
                        context, 
                        'Restaurant', 
                        Icons.restaurant,
                        'Restaurant'
                      ),

                      const SizedBox(
                        height: 5
                      ),

                      buildButton(
                        context, 
                        'Museum', 
                        Icons.museum,
                        'Museum'
                      ),

                      const SizedBox(
                        height: 5
                      ),

                      buildButton(
                        context, 
                        'Beach', 
                        Icons.beach_access,
                        'Beach'
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

  Widget buildButton(
    BuildContext context, 
    String text, 
    IconData iconData,
    String type
    ) {

    return GestureDetector(
       onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PlacesList()),//Display_Data(deptName: name, type: type, image: imagePath)),
      ),
  
      child: Container(
        margin: const EdgeInsets.all(10.0),
        height: 90.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              offset: Offset(5.0, 10.0),
              blurRadius: 5.0,
              color: Colors.black45
            ),
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              width: 5.0,
            ),
            Icon(
              iconData,
              size: 35.0,
              color: const Color.fromARGB(255, 233, 66, 16),
            ),
            const SizedBox(
              width: 5.0,
            ),
            Text(
                text,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),
              ),
            const SizedBox(
              width: 5.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: const Icon(
                Icons.arrow_forward_ios,
                size: 30.0,
                color: Colors.black26,
              ),
            ),
          ]
        ),
      ),
    );
  }
}





      
    
  


