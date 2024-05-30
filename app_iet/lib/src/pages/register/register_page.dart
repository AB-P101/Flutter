import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    Future<void> insertrecord() async {
      if (name.text != "" || email.text != "" || password.text != "") {
        try { 
          String uri =
              "https://ae90-223-24-188-173.ngrok-free.app/practice_api/insert_record.php";

          var res = await http.post(Uri.parse(uri), body: {
            "name": name.text,
            "email": email.text,
            "password": password.text
          });

          var response = jsonDecode(res.body);
          if (response["success"] == "true") {
            print("Record Inserted");
            name.text = "";
            email.text = "";
            password.text = "";
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

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.all(30),
            margin: const EdgeInsets.all(20),
            width: double.infinity,
            height: size.height * 0.5,
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
                Text(
                  "Register",
                  style: Theme.of(context).textTheme.headline4
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: name,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 58, 183, 60))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 58, 183, 60),
                            width: 2)),
                    prefixIcon: Icon(Icons.account_circle_sharp),        
                    hintText: '',
                    labelText: 'Username',
                    //prefixIcon: Icon(Icons.alternate_email_rounded)
                    //suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.alternate_email_rounded))
                  ),
                ),
                TextFormField(
                  controller: email,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 58, 183, 60))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 58, 183, 60), width: 2)),
                    prefixIcon: Icon(Icons.alternate_email_rounded),
                    hintText: '',
                    labelText: 'E-mail',
                  ),
                ),
                TextFormField(
                  controller: password,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color.fromARGB(255, 58, 183, 60))),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Color.fromARGB(255, 58, 183, 60), width: 2)),
                    prefixIcon: Icon(Icons.lock_outline),
                    hintText: '',
                    labelText: 'Password',
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
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
                      insertrecord();
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
                    },
                  ),
                ]),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
