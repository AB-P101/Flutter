import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iethasoftware/src/pages/routes.dart';
import 'package:http/http.dart' as http;

class HomeIN_ extends StatefulWidget {
  const HomeIN_({super.key});

  @override
  State<HomeIN_> createState() => _HomePageState();
}

class _HomePageState extends State<HomeIN_> {
  @override
    List userdata = [];

  Future<void> delrecord(String id) async{
    String uri = "https://6113-2001-fb1-14f-4c58-a9a9-42a7-d6b6-811c.ngrok-free.app/practice_api/delete_data.php";
    try{
      var res = await http.post(Uri.parse(uri),body:{
        "id":id
      });
      var response = jsonDecode(res.body);

      if(response["success"]=="true"){
        print("record dleted");
        getrecord();
      }else{
        print("some issue");
      }
    }catch(e){print(e);}
  }

  Future<void> getrecord() async {
    String uri = "https://6113-2001-fb1-14f-4c58-a9a9-42a7-d6b6-811c.ngrok-free.app/practice_api/view_data.php";
    try {
      var response = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(response.body);
      });
     // userdata = jsonDecode(response.body);
      print(userdata);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
          title:const Text("Products INPUT"),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoute.page_add);
              },
              icon:const Icon(Icons.add),
            )
          ],
        ),
      body: ListView.builder(
          itemCount: userdata.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(10),

              child: ListTile(
                leading: Icon(
                  CupertinoIcons.heart,
                  color: Colors.red,
                ),
                title: Text("ID:"+userdata[index]["IDCode"]+"     Type:"+userdata[index]["pType"]+"     In:"+userdata[index]["pDateIn"]), 
                subtitle: Text("Quantity:"+userdata[index]["pQuantity"]+""),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed:() {
                    delrecord(userdata[index]["pid"]);
                  },
                ),
              ),
            );
          }),
    );
  }
}

