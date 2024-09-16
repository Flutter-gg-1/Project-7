import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_judge/screens/loading%20screen/loading_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  void initState() {
    waitABit();
    super.initState();
  }

  Future<void> waitABit() async {
    await Future.delayed(const Duration(seconds: 6));

    if (mounted) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoadingScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset("assets/gif/Tuwaiq_Logo-Animation.gif"),
      ),
    );
  }
}
