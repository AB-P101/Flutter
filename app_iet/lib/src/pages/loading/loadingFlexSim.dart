import 'package:flutter/material.dart';

class loading_flex extends StatefulWidget {
  const loading_flex({super.key});

  @override
  State<loading_flex> createState() => loading_fl();
}

class loading_fl extends State<loading_flex> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 200, 221, 233),
      body: Center(
        child: Image(
          width: 200,
          image: AssetImage('lib/icons/FlexSim_ProblemSolved_R-1000px.png'),
          
        ),
      ),
    );
  }
}
