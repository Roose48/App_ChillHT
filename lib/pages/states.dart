import 'package:app/components/departements.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/places.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

import 'homepage.dart';

class States extends StatefulWidget {
  const States({super.key});
  @override
  State<States> createState() => _StatesState();
}

class _StatesState extends State<States> {

  List<Departement> deptList = [
    Departement("Nord", "assets/images/Nord.jpg"),
    Departement("Nord-Est", "assets/images/NordEst.jpeg"),
    Departement("Nord-Ouest", "assets/images/NordOuest.jpg"),
    Departement("Artibonite", "assets/images/Artibonite.png"),
    Departement("Centre", "assets/images/Centre.jpg"),
    Departement("Ouest", "assets/images/Ouest.jpg"),
    Departement("Sud-Est", "assets/images/bassin_bleu.jpg"),
    Departement("Sud", "assets/images/sud.jpg"),
    Departement("Nippes", "assets/images/nippes.jpg"),
    Departement("Grand'Anse", "assets/images/GrandeAnse.jpg"),

  ];


  Widget _buildDeptCard(BuildContext context, int index){
    Departement dept = deptList[index];

    return  GestureDetector(
    onTap: ()  => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  Places(dept: dept.name, imagePath: dept.imagePath),
        ),
      ),

      child: SizedBox(
        width: 250,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                dept.imagePath
                ),
              fit: BoxFit.cover,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 70,
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(10.0),
                      right: Radius.circular(10.0),
                       
                    )
                  ),
                  child: Center(
                    child: Text(
                      dept.name,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                      ),
                    ),
                  )
              ),
            ],
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
            image: AssetImage("assets/images/cover.jpg"),
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
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10.0),
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

            const SizedBox(height: 50),

            Expanded(
              child: Center(
                  child: ScrollSnapList(
                    itemBuilder: _buildDeptCard, 
                    itemCount: deptList.length, 
                    itemSize: 250, 
                    onItemFocus: (index) {},
                    dynamicItemSize: true,
                    focusOnItemTap: true,
                    allowAnotherDirection: true,
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
