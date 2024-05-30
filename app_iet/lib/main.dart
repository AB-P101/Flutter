import 'package:flutter/material.dart';
import 'package:iethasoftware/src/app.dart';

void main() {
  runApp(const CMApp());
}

/*import 'package:flutter/material.dart';

void main() {
  runApp(RunMyApp());
}

class RunMyApp extends StatelessWidget {
  const RunMyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Prefix and Suffix Icon in TextField'),
        ),
        body: Container(
          padding: EdgeInsets.all(20.0),
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple, width: 2)),
              hintText: '',
              labelText: 'Date In',
              suffixIcon: IconButton(
                icon: Icon(Icons.arrow_drop_down_circle),
                onPressed: () {},
              ),
            ),
          ),

          /*child: TextFormField( 
            decoration: InputDecoration( 
              border: UnderlineInputBorder(), 
              hintText: "Email", 
              labelText: "Email", 
              prefixIcon: 
                  IconButton(onPressed: () {}, icon: Icon(Icons.email_rounded)), 
              suffixIcon: IconButton( 
                icon: Icon(Icons.arrow_drop_down_circle), 
                onPressed: () {}, 
              ), 
            ), 
            keyboardType: TextInputType.emailAddress, 
            textInputAction: TextInputAction.done, 
          ), */
        ),
      ),
    );
  }
}


/*TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepPurple)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.deepPurple, width: 2)),
                    hintText: '',
                    labelText: 'Date In',
                    /*suffixIcon: IconButton( 
                      icon: Icon(Icons.arrow_drop_down_circle), 
                      onPressed: () {}, 
                    ),*/
                    //prefixIcon: Icon(Icons.alternate_email_rounded)
                  ),
                ),*/*/