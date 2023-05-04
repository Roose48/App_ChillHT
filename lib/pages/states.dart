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

  List<String> deptList = [
    "Artibonite",
    "Centre",
    "Grand'Anse",
    "Nippes",
    "Nord",
    "Nord-Est",
    "Nord-Ouest",
    "Ouest",
    "Sud",
    "Sud-Est"
  ];

  Widget _buildDeptCard(BuildContext context, int index){
    String dept = deptList[index];

    return  GestureDetector(
    onTap: ()  => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  Places(name: dept),
        ),
      ),

      child: SizedBox(
        width: 250,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/bassin_bleu.jpg"
                ),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
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
                      dept,
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

            SizedBox(height: 20),

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
