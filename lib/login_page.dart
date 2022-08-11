import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nfcpay/logged_in.dart';

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
              body: Column(
                children: [
                  SizedBox(
                    height: height / 5,
                  ),
                  Text("Sign In"),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email Id',
                      hintText: 'Enter Your Email',
                    ),
                    controller: namecontroller,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Your Password',
                    ),
                    controller: passcontroller,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        signIn();
                      },
                      child: Text("Sign in"))
                ],
              ),
            );
          }
        });
  }
  Future signIn() async {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: namecontroller.text.trim(),
          password: passcontroller.text.trim());
    }
}
