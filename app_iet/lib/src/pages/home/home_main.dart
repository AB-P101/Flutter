import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iethasoftware/src/pages/routes.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage_ extends StatefulWidget {
  const HomePage_({super.key});

  @override
  State<HomePage_> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage_> {
  String _scanBarcode = 'Unknown';

  @override
  void initState() {
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
//barcode scanner flutter ant
    setState(() {
      _scanBarcode = barcodeScanRes;
      if (_scanBarcode != "-1" && _scanBarcode != "Unknown") {
        showAlertDialog(context, _scanBarcode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: Stack(
          children: [
            
            Positioned(
              top:40,
              right:30,
              child : IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, AppRoute.login2);
                },
                icon:const Icon(Icons.logout,size: 30,),
                ),
            ),
            Positioned(
              top: 40,
              right: 30,
              child: Text('Exit'),
            ),
            Center(
              child: Container(
                //color: Colors.black,
                width: 350,
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(43, 124, 124, 124),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'lib/icons/barcode-scan.png'),
                                  ),
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  onPressed: _btnTestScaner,
                                  icon: const Icon(
                                    Icons.access_alarm_outlined,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(43, 124, 124, 124),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage('lib/icons/Report.png'),
                                  ),
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  onPressed: _btnHomeReport,
                                  icon: const Icon(
                                    Icons.access_alarm_outlined,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(43, 124, 124, 124),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage('lib/icons/BOXIN.png'),
                                  ),
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  onPressed: _btnHomeIN,
                                  icon: const Icon(
                                    Icons.access_alarm_outlined,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            fit: FlexFit.tight,
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromARGB(43, 124, 124, 124),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                  color: Colors.transparent,
                                  image: DecorationImage(
                                    image: AssetImage('lib/icons/BOXOUT.png'),
                                  ),
                                ),
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  onPressed: _btnHomeOut,
                                  icon: const Icon(
                                    Icons.access_alarm_outlined,
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          ],
        ),

        /*child: Container(
          color: Colors.black,
          width: 350,
          height: 350,
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(children: <Widget>[
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(110, 116, 174, 207),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage('lib/icons/barcode-scan.png'),
                            ),
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: _btnTestScaner,
                            icon: const Icon(
                              Icons.access_alarm_outlined,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(110, 116, 174, 207),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage('lib/icons/Report.png'),
                            ),
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: _btnHomeReport,
                            icon: const Icon(
                              Icons.access_alarm_outlined,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Row(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(110, 116, 174, 207),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage('lib/icons/BOXIN.png'),
                            ),
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: _btnHomeIN,
                            icon: const Icon(
                              Icons.access_alarm_outlined,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(111, 116, 174, 207),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                            image: DecorationImage(
                              image: AssetImage('lib/icons/BOXOUT.png'),
                            ),
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(0.0),
                            onPressed: _btnHomeOut,
                            icon: const Icon(
                              Icons.access_alarm_outlined,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),*/
      ),
    );
  }

  void _btnTestScaner() {
    scanQR();
  }

  Future<void> _btnHomeReport() async {
    Navigator.pushNamed(context, AppRoute.loading);
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoute.homereport);
  }

  Future<void> _btnHomeIN() async {
    Navigator.pushNamed(context, AppRoute.loading);
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoute.homein);
  }

  Future<void> _btnHomeOut() async {
    Navigator.pushNamed(context, AppRoute.loading);
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pop(context);
    Navigator.pushNamed(context, AppRoute.homeout);
  }
}

showAlertDialog(BuildContext context, var txt) {
  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Scan OK"),
    content: Text('Scan result : \n$txt\n'),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
//child: Text("No Data",style: TextStyle(fontSize: 46))
