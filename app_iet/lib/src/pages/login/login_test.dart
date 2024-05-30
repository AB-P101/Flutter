import 'package:flutter/material.dart';
import 'package:iethasoftware/src/pages/routes.dart';

class LoginPagetest extends StatefulWidget {
  const LoginPagetest({Key? key}) : super(key: key);

  @override
  State<LoginPagetest> createState() => _LoginPageStatetest();
}

class _LoginPageStatetest extends State<LoginPagetest> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = "admin";
    _passwordController.text = "1234";
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            loginform(context),
          ], 
        ),
      ),
    );
  }

  SingleChildScrollView loginform(BuildContext context) {
    return SingleChildScrollView(
        child: Center(
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Container(
            padding: EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            height: 360,
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
            child: Column(
              children: [
                Text(
                  'WMS',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Form(
                    child: Column(
                      children: [
                        TextFormField(
                          autocorrect: false,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.deepPurple)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.deepPurple, width: 2)),
                              hintText: 'E-meail',
                              labelText: 'Username',
                              prefixIcon: Icon(Icons.alternate_email_rounded)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.deepPurple)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.deepPurple, width: 2)),
                            hintText: '*********',
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: Icon(Icons.remove_red_eye),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          disabledColor: Colors.grey,
                          color: Colors.green,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            child: Text(
                              'LOGIN',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: () async {
                            Navigator.pushNamed(context, AppRoute.loadingFlex);
                            await Future.delayed(const Duration(seconds: 1));
                            Navigator.pushReplacementNamed(
                                context, AppRoute.homeout);
                          },
                        ),
                        TextButton(
                          child: Text(
                            'Resigter',
                            style: TextStyle(color: Colors.blue, fontSize: 16),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoute.register);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            'IE Thai Software Co., Ltd.@FlexSim',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 0, 0, 0)),
          ),
        ],
      ),
    ));
  }

  Container cajapurpura(Size size) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 58, 133, 194),
          Color.fromARGB(255, 189, 40, 40),
        ]),
      ),
      width: double.infinity,
      height: size.height * 0.4,
    );
  }
}
