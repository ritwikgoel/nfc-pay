import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lottie/lottie.dart';

class introScreen extends StatelessWidget {
  const introScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 61, 155),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 7,
            ),
            Center(
                child: CircleAvatar(
              child: LottieBuilder.asset(
                "assets/intro.json",
                height: 233,
              ),
              radius: width / 3,
            )),
            SizedBox(
              height: height / 15,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "A one stop portal for all your P2P transactions!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: height / 50),
              ),
            ),
            SizedBox(
              height: height / 7,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 3,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                minimumSize: Size(height / 5, width / 7), //////// HERE
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text('Get Started'),
            )
          ],
        ),
      ),
    );
  }
}
