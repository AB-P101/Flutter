import 'package:flutter/material.dart';

class HomeReport extends StatefulWidget {
  const HomeReport({super.key});

  @override
  State<HomeReport> createState() => _HomePageState();
}

class _HomePageState extends State<HomeReport> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:const Text("Report Products"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                print('Add');
              },
              icon:const Icon(Icons.add),
            )
          ],
        ),
        body: Container(
          child: const Center(child: Text("No Data", style: TextStyle(fontSize: 46))),
        ));
  }
}
