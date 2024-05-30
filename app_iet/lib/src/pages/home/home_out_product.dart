import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iethasoftware/src/pages/routes.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:http/http.dart' as http;

class HomeOut_ extends StatefulWidget {
  const HomeOut_({super.key});

  @override
  State<HomeOut_> createState() => _HomePageState();
}

class _HomePageState extends State<HomeOut_> {
  @override
  List search = [];
  List FIFOdata = [];
  List LIFOdata = [];
  TextEditingController search_ = TextEditingController();
  TextEditingController datein_ = TextEditingController();
  TextEditingController dateout_ = TextEditingController();
  Future<void> delrecord(String id) async {
    String uri = "https://6334-2403-6200-8820-3c1a-c188-6be9-e5be-5066.ngrok-free.app/practice_api/delete_data.php";
    try {
      var res = await http.post(Uri.parse(uri), body: {"id": id});
      var response = jsonDecode(res.body);

      if (response["success"] == "true") {
        print("record dleted");
        getrecord();
      } else {
        print("some issue");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getrecord() async {
    String uriFIFO = "https://6334-2403-6200-8820-3c1a-c188-6be9-e5be-5066.ngrok-free.app/practice_api/FIFO.php";
    String uriLIFO = "https://6334-2403-6200-8820-3c1a-c188-6be9-e5be-5066.ngrok-free.app/practice_api/LIFO.php";
    try {
      var FIFO = await http.get(Uri.parse(uriFIFO));
      var LIFO = await http.get(Uri.parse(uriLIFO));
      setState(() {
        FIFOdata = jsonDecode(FIFO.body);
        LIFOdata = jsonDecode(LIFO.body);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> getsearch() async {
    if (search_.text != "") {
      try {
        String uri ="https://6334-2403-6200-8820-3c1a-c188-6be9-e5be-5066.ngrok-free.app/practice_api/view_data.php";

        var res = await http.post(Uri.parse(uri), body: {
          "IDCode": search_.text,
        });

        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record Inserted");
        } else {
          print("some isssue");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("please Fill All Fileds");
    }
  }

  @override
  void initState() {
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime(2022, 12, 24);
    final size = MediaQuery.of(context).size;
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 1, 131, 34),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, AppRoute.page_add);
              },
              icon: const Icon(Icons.add),
            )
          ],
          title: const Text('Products'),
          bottom: const TabBar(
            indicatorWeight: 10,
            labelColor: Color.fromARGB(255, 255, 255, 255),
            indicatorColor: Color.fromARGB(255, 3, 77, 3),
            tabs: <Widget>[
              Tab(
                text: 'FIFO',
                //icon: Icon(Icons.search),
              ),
              Tab(
                text: 'LIFO',
                //icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.search),
                //text: 'Search',
              ),
            ],
          ),
        ),
        body: FIFOdata.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : TabBarView(
                children: <Widget>[
                  Center(
                    child: ListView.builder(
                        itemCount: FIFOdata.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(176, 255, 255, 255),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 15,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.airplane,
                                color: Colors.red,
                              ),
                              title: Text("ID           :  " +
                                  FIFOdata[index]["IDCode"] +
                                  "\nType      :  " +
                                  FIFOdata[index]["pType"] +
                                  "\nDate      :  " +
                                  FIFOdata[index]["pDateIn"]),
                              subtitle: Text("\nQuantity :  " +
                                  FIFOdata[index]["pQuantity"] +
                                  ""),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  delrecord(FIFOdata[index]["pid"]);
                                },
                              ),
                            ),
                          );
                        }),
                  ),
                  Center(
                    child: ListView.builder(
                        itemCount: LIFOdata.length,
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(176, 255, 255, 255),
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 15,
                                  offset: Offset(0, 5),
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(10),
                            child: ListTile(
                              leading: Icon(
                                CupertinoIcons.airplane,
                                color: Colors.red,
                              ),
                              title: Text("ID           :  " +
                                  LIFOdata[index]["IDCode"] +
                                  "\nType      :  " +
                                  LIFOdata[index]["pType"] +
                                  "\nDate      :  " +
                                  LIFOdata[index]["pDateIn"]),
                              subtitle: Text("\nQuantity :  " +
                                  LIFOdata[index]["pQuantity"] +
                                  ""),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  delrecord(LIFOdata[index]["pid"]);
                                },
                              ),
                            ),
                          );
                        }),
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: size.width * 0.65,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              //controller: type_,
                              autocorrect: false,
                              decoration: const InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 10.0),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.deepPurple)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.deepPurple, width: 2)),
                                hintText: '',
                                labelText: 'search id',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: size.width * 0.30,
                                  child: TextFormField(
                                    controller: datein_,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepPurple)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepPurple,
                                              width: 2)),
                                      hintText: '',
                                      labelText: 'Date In',
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.event),
                                        onPressed: () async {
                                          var datePicked = await DatePicker
                                              .showSimpleDatePicker(
                                            context,
                                            initialDate: date,
                                            firstDate: DateTime(2020),
                                            lastDate: DateTime(2090),
                                            dateFormat: "dd-MMMM-yyyy",
                                            locale: DateTimePickerLocale.en_us,
                                            looping: true,
                                          );
                                          if (datePicked == null) return;
                                          setState(() => date = datePicked);
                                          datein_.text =
                                              "${date.day}/${date.month}/${date.year}";
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: size.width * 0.30,
                                  child: TextFormField(
                                    controller: dateout_,
                                    autocorrect: false,
                                    decoration: InputDecoration(
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepPurple)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.deepPurple,
                                              width: 2)),
                                      hintText: '',
                                      labelText: 'Date Out',
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.event),
                                        onPressed: () async {
                                          var datePicked = await DatePicker
                                              .showSimpleDatePicker(
                                            context,
                                            initialDate: date,
                                            firstDate: DateTime(2020),
                                            lastDate: DateTime(2090),
                                            dateFormat: "dd-MMMM-yyyy",
                                            locale: DateTimePickerLocale.en_us,
                                            looping: true,
                                          );
                                          if (datePicked == null) return;
                                          setState(() => date = datePicked);
                                          dateout_.text =
                                              "${date.day}/${date.month}/${date.year}";
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.search)),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      /*Expanded(
                        child: ListView.builder(
                            itemCount: userdata.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(176, 255, 255, 255),
                                  borderRadius: BorderRadius.circular(25),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 15,
                                      offset: Offset(0, 5),
                                    ),
                                  ],
                                ),
                                margin: EdgeInsets.all(10),
                                child: ListTile(
                                  leading: Icon(
                                    CupertinoIcons.heart,
                                    color: Colors.red,
                                  ),
                                  title: Text("ID:" +
                                      userdata[index]["IDCode"] +
                                      "     Type:" +
                                      userdata[index]["pType"] +
                                      "     In:" +
                                      userdata[index]["pDateIn"]),
                                  subtitle: Text("Quantity:" +
                                      userdata[index]["pQuantity"] +
                                      ""),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      delrecord(userdata[index]["pid"]);
                                    },
                                  ),
                                ),
                              );
                            }),
                      ),*/
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
