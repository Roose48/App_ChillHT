import 'package:flutter/material.dart';
import 'package:app/pages/places.dart';

import 'homepage.dart';

class States extends StatefulWidget {
  const States({super.key});


  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {

  Widget deptCard(String name){
    return  GestureDetector(
    onTap: ()  => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  Places(name: name),
        ),
      ),
     child: Container(
        height: 70.0,
        width: 10.0,
        margin: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 233, 66, 16),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
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
            image: AssetImage("assets/images/bassin_bleu.jpg"),
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
                    height: 5.0,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Homepage()),
                      );
                    }, 
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      size: 30.0,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    'assets/images/chillHT_logo.png',
                    height: 80,
                    width: 80,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Discover',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  
                  ShaderMask(
                    shaderCallback: (bounds) => const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.mirror,
                      colors: [
                        Color.fromARGB(255, 0, 81, 232), 
                        Color.fromARGB(255, 222, 0, 0)
                      ],
                    ).createShader(bounds),
                    child: const Text(
                      'Haiti',
                      style: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),

          SizedBox(height: 5),
            
            Expanded(
                flex: 3,
                child: Container(
                    decoration: const BoxDecoration(
                    color: Color.fromARGB(174, 255, 255, 255),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                    child: ListView(
                      children: [
                        deptCard("Ouest"),
                        deptCard("Sud-Est"),
                        deptCard("Nord"),
                        deptCard("Nord-Est"),
                        deptCard("Artibonite"),
                        deptCard("Centre"),
                        deptCard("Sud"),
                        deptCard("GrandAnse"),
                        deptCard("Nord-Ouest"),
                        deptCard("Nippes"),

                      ],
                      ),
                    ),
              ),
          ]
          ),
      ),
    ),
    );
  }
}

// child: ListView(
//           children: [
//             const SizedBox(
//               height: 20,
//               width: 20,
//             ),
//             const TextField(
//               decoration: InputDecoration(
//                   labelText: 'Search', suffixIcon: Icon(Icons.search)),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: allDepartment.length,
//                 itemBuilder: (context, index) => GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DepartmentPage(
//                           department: allDepartment[index],
//                         ),
//                       ),
//                     );
//                   },
//                   child: Card(
//                     key: ValueKey(allDepartment[index]["id"]),
//                     color: Colors.blue,
//                     elevation: 4,
//                     margin: const EdgeInsets.symmetric(vertical: 10),
//                     child: ListTile(
//                       leading: Text(
//                         allDepartment[index]["id"].toString(),
//                         style: const TextStyle(
//                             fontSize: 24, color: Colors.white),
//                       ),
//                       title: Text(allDepartment[index]["name"]),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),

class DepartmentPage extends StatelessWidget {
  final Map<String, dynamic> department;

  const DepartmentPage({required this.department});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //  appBar: AppBar(
    //     title: Text(department["name"]),
    //  ),
    //   body: Center(
    //     child: Text(
    //      "This is the ${department["name"]} department page",
    //      style: const TextStyle(fontSize: 24),
    //     ),
    //   ),
    );
  }
}
