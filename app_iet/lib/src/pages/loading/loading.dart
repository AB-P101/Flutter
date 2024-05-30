import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';

class loading_ extends StatefulWidget {
  const loading_({super.key});

  @override
  State<loading_> createState() => loading_io();
}

class loading_io extends State<loading_> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 29, 66, 87),

      body: Center(
        child: SpinKitFadingCube(
          size: 30,
          duration: Duration(seconds: 2),
          color: Colors.white,
        ),
      ),
    );
  }
}

