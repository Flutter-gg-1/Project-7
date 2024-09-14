import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin:Alignment.topCenter ,
            end: Alignment.bottomCenter,
            colors: [
            Color.fromARGB(82, 109, 29, 189),
            Color.fromARGB(255, 72, 13, 127),
            Color.fromARGB(255, 39, 1, 61),
          ], stops: [
            0.15,
            0.55,
            0.88
          ]),
          image: DecorationImage(
              image: AssetImage('assets/image/splach_background.png'),
              fit: BoxFit.cover)),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
