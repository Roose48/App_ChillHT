import 'package:flutter/material.dart';
import 'package:app/pages/places.dart';

class States extends StatefulWidget {
  const States({super.key, required this.title, required String name});

  final String title;

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
      body: SafeArea(
      child: Container(
        color: Colors.black,
        child: Column(
          children: [
      const SizedBox(height: 20),
            Center(
              child: Image.asset(
            'assets/images/chillHT.png',
            width: 100,
            height: 100,
          ),
        ),

      SizedBox(height: 5),
      
      Container(
                color: Colors.black,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.all(20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'search',
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: Icon(Icons.search, color: Colors.black),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20),
                      borderSide: BorderSide.none)
                  ),
                ),
              ),
            
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
