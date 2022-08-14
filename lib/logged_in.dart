import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nfc_manager/nfc_manager.dart';

class loggedin extends StatelessWidget {
  const loggedin({super.key});

  @override
  Widget build(BuildContext context) {
    final upi_id = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 61, 155),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: height / 3,
            ),
            Text(
              "${user.email}",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(
              height: height / 10,
            ),
            TextField(
              controller: upi_id,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                labelText: 'Enter your UPI-ID',
                hintText: 'Enter your UPI-ID',
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Save your ID")),
            SizedBox(
              height: height / 15,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width / 4, 0, 0, 0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/upi_init');
                      },
                      child: Text("Pay")),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(width / 10, 0, 0, 0),
                  child:
                      ElevatedButton(onPressed: () {}, child: Text("Request")),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                child: Text("Sign out"))
          ],
        ),
      ),
    );
  }
}
