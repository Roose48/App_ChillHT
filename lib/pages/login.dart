import 'package:app/pages/register.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key, required String title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.black, Colors.black]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: const Center(
                    child: Image(image: AssetImage('assets/images/chillHT.png',)),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      CustomSizedBox(height: 25.0),
                      LogField(
                        label: "Username",
                        icon: Icons.person_outline_rounded,
                        hinttext: "John Doe",
                      ),
                      CustomSizedBox(height: 30.0),
                      LogField(
                        label: "Password",
                        icon: Icons.key,
                        hinttext: "******",
                      ),
                      CustomSizedBox(
                        height: 25.0,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Container(
                            height: 50.0,
                            width: 90.0,
                            margin: const EdgeInsets.symmetric(horizontal: 130),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomSizedBox(
                        height: 10.0,
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(horizontal: 70),
                        child: Row(
                          children: [
                            Label(
                              text: "Don't have an account/",
                            ),
                            GestureDetector(
                              onTap: () {
                                // Todo Code ges here
                              },
                              child: Label(
                                text: "Register",
                                color: Color.fromARGB(255, 1, 31, 66),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      BottomNavigationBar(
                        items: const [
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home),
                            label: "Home",
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.settings),
                            label: "Settings",
                          ),
                      ],
                    ),
                    ]
                ),
              ),
          )],
          
          ),
        ),
      ),
    );
    

  }
}


class Label extends StatelessWidget {
  Label({required this.text, this.color = Colors.black});
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: color),
    );
  }
}

class LogField extends StatelessWidget {
  LogField({required this.label, required this.icon, this.hinttext = ""});

  String label, hinttext;
  IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              icon: Icon(
                icon,
                color: Color.fromARGB(255, 1, 31, 66),
              ),
              hintText: hinttext,
              hintStyle: const TextStyle(
                color: Colors.grey,
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  CustomSizedBox({this.height = 0, this.width = 0});

  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  // FloatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
  // FloatingActionButton: FloatingActionButton(
  //   backgroundColor: Colors.white,
  //   onPressed: () {},
  //   Tooltip: 'Increment',
  //   child: Icon(Icons.add),
  // ),
  // BottomNavigationBar: BottomNavigationBar(
  //   items: [
  //     BottomNavigationBar(
  //       icon: Icon(Icons.home),
  //       Label: "Home",
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Icon(Icons.settings),
  //           Label: "settings",
  //         )
  //   ]
  // )

}