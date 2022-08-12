import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nfcpay/logged_in.dart';
import 'package:nfcpay/main.dart';

import 'introScreen.dart';

class login_page extends StatefulWidget {
  const login_page({super.key});

  @override
  State<login_page> createState() => _login_pageState();
}

class _login_pageState extends State<login_page> {
  final namecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  @override
  void dispose() {
    namecontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    double height = MediaQuery.of(context).size.height;

    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return loggedin();
          } else {
            return Scaffold(
              backgroundColor: Color.fromARGB(255, 45, 61, 155),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height / 5,
                    ),
                    Text(
                      "Sign In",
                      style: TextStyle(
                          fontSize: height / 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height / 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            labelText: 'Email Id',
                            hintText: 'Enter Your Email',
                          ),
                          controller: namecontroller,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          labelText: 'Password',
                          hintText: 'Enter Your Password',
                        ),
                        controller: passcontroller,
                      ),
                    ),
                    SizedBox(
                      height: height / 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0)),
                        minimumSize: Size(height / 4, width / 8),
                      ),
                      onPressed: () {
                        signIn();
                      },
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: height / 30,
                            color: Color.fromARGB(255, 26, 37, 39)),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Create Account"),
                    )
                  ],
                ),
              ),
            );
          }
        });
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: CircularProgressIndicator(),
            ));
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: namecontroller.text.trim(),
        password: passcontroller.text.trim());

navigatorkey.currentState!.popUntil((route) => route.isFirst);
  }
}
