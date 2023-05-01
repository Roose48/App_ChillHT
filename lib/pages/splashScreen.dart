import 'package:flutter/material.dart';
import 'package:app/pages/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key, required String title});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatehome();
  }
  

  void _navigatehome() async {
  await Future.delayed(const Duration (milliseconds: 5000), () {});
  // ignore: use_build_context_synchronously
  Navigator.pushReplacement(
    context,
     MaterialPageRoute(
      builder: (context) => Homepage ()));

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
            'assets/images/chillHT.png',
            width: 200,
            height: 200,
              )
            ),
         ],
        ),
      ),
      );
  }
}
