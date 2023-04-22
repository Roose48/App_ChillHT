import 'package:flutter/material.dart';

class States extends StatefulWidget {
  const States({super.key, required this.title});

  final String title;

  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {
  List<Map<String, dynamic>> allDepartment = [
    {"id": 1, "name": 'Oeust'},
    {"id": 2, "name": 'Sud-Est'},
    {"id": 3, "name": 'Nord'},
    {"id": 4, "name": 'Nord-Est'},
    {"id": 5, "name": 'Artibonite'},
    {"id": 6, "name": 'Centre'},
    {"id": 7, "name": 'Sud'},
    {"id": 8, "name": 'GrandAnse'},
    {"id": 9, "name": 'Nord-Ouest'},
    {"id": 10, "name": 'Nippes'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Department'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
              width: 20,
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allDepartment.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DepartmentPage(
                          department: allDepartment[index],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    key: ValueKey(allDepartment[index]["id"]),
                    color: Colors.blue,
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Text(
                        allDepartment[index]["id"].toString(),
                        style: const TextStyle(
                            fontSize: 24, color: Colors.white),
                      ),
                      title: Text(allDepartment[index]["name"]),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DepartmentPage extends StatelessWidget {
  final Map<String, dynamic> department;

  const DepartmentPage({required this.department});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(department["name"]),
      ),
      body: Center(
        child: Text(
          "This is the ${department["name"]} department page",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
