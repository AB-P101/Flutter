import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iethasoftware/src/pages/routes.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:http/http.dart' as http;

class add_in extends StatefulWidget {
  const add_in({super.key});

  @override
  State<add_in> createState() => add_in_();
}

class add_in_ extends State<add_in> {
  DateTime? _selectedDate;
  String _scanBarcode = 'Unknown';
  final _formKey = GlobalKey<FormState>();
  TextEditingController idcode_ = TextEditingController();
  TextEditingController type_ = TextEditingController();
  TextEditingController quantity_ = TextEditingController();
  TextEditingController datein_ = TextEditingController();
  TextEditingController dateout_ = TextEditingController();
  TextEditingController rack_ = TextEditingController();
  TextEditingController floor_ = TextEditingController();
  TextEditingController channel_ = TextEditingController();

  Future<void> insertrecord() async {
    if (idcode_.text != "" || type_.text != "" || quantity_.text != "") {
      try {
        String uri =
            "https://6334-2403-6200-8820-3c1a-c188-6be9-e5be-5066.ngrok-free.app/practice_api/insert_product.php";

        var res = await http.post(Uri.parse(uri), body: {
          "IDCode": idcode_.text,
          "pType": type_.text,
          "pQuantity": quantity_.text,
          "pDateIn": datein_.text,
          //"pDateOut": dateout_.text,
          "pRack": rack_.text,
          "pFloor": floor_.text,
          "pChannel": channel_.text,
        });

        var response = jsonDecode(res.body);
        if (response["success"] == "true") {
          print("Record Inserted");
          idcode_.text = "";
          type_.text = "";
          quantity_.text = "";
          datein_.text = "";
          dateout_.text = "";
          rack_.text = "";
          floor_.text = "";
          channel_.text = "";
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

  void initState() {
    DateTime now = DateTime.now();
    datein_.text = "${now.day}/${now.month}/${now.year}";
    super.initState();
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    setState(() {
      _scanBarcode = barcodeScanRes;
      if (_scanBarcode != "-1" && _scanBarcode != "Unknown") {
        idcode_.text = _scanBarcode;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime(2022, 12, 24);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(30),
                margin: const EdgeInsets.all(20),
                width: double.infinity,
                height: size.height * 0.7,
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
                child: SingleChildScrollView(
                  child: Column(children: [
                    Text("Add", style: Theme.of(context).textTheme.headline4),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: idcode_,
                      autocorrect: false,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2)),
                        hintText: '',
                        labelText: 'ID Code',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.qr_code_2),
                          onPressed: () async {
                            scanQR();
                          },
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Please enter ID.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: type_,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2)),
                        hintText: '',
                        labelText: 'Type',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Please enter Type.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: quantity_,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2)),
                        hintText: '',
                        labelText: 'Quantity',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Please enter Quantity.';
                        }
                        return null;
                      },
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: size.width * 0.50,
                          child: TextFormField(
                            controller: datein_,
                            autocorrect: false,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple, width: 2)),
                              hintText: '',
                              labelText: 'Date In',
                              suffixIcon: IconButton(
                                icon: Icon(Icons.event),
                                onPressed: () async {
                                  var datePicked =
                                      await DatePicker.showSimpleDatePicker(
                                    context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2020),
                                    lastDate: DateTime(2040),
                                    dateFormat: "dd-MM-yyyy",
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
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return '*Please enter Date In.';
                              }
                              return null;
                            },
                          ),
                        ),
                        /*SizedBox(
                    width: size.width * 0.36,
                    child: TextFormField(
                      controller: dateout_,
                      autocorrect: false,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2)),
                        hintText: '',
                        labelText: 'Date Out',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.event),
                          onPressed: () async {
                            var datePicked =
                                await DatePicker.showSimpleDatePicker(
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
                  ),*/
                      ],
                    ),
                    TextFormField(
                      controller: rack_,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2)),
                        hintText: '',
                        labelText: 'Rack',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Please enter Rack.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: floor_,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2)),
                        hintText: '',
                        labelText: 'Floor',
                        //prefixIcon: Icon(Icons.alternate_email_rounded)
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Please enter Floor.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: channel_,
                      autocorrect: false,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.deepPurple, width: 2)),
                        hintText: '',
                        labelText: 'Channel',
                        //prefixIcon: Icon(Icons.alternate_email_rounded)
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '*Please enter Channel.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ]),
                ),
              ),
              Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledColor: Colors.grey,
                    color: Colors.green,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        insertrecord();
                        Navigator.pop(context);
                        Navigator.pushNamed(context, AppRoute.homeout);
                      }
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledColor: Colors.grey,
                    color: Color.fromARGB(255, 240, 4, 4),
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, AppRoute.homeout);
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _btnHomeOut() {
    print('object');
  }
}
