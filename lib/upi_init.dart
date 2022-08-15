// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:upi_india/upi_india.dart';

class upi_main extends StatefulWidget {
  const upi_main({super.key});

  @override
  State<upi_main> createState() => _upi_mainState();
}

class _upi_mainState extends State<upi_main> {
  UpiIndia _upiIndia = UpiIndia();
  UpiApp app = UpiApp.phonePe;
  Future<UpiResponse> initiateTransaction(UpiApp app,String Upi_sendTo) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: Upi_sendTo,
      receiverName: 'Ritwik Goel',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Not actual. Just an example.',
      amount: 1.00,
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
        final upicontroller = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 45, 61, 155),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: height / 5,
              ),
              const Text(
                "Enter Upi to Pay to",
                style: TextStyle(color: Colors.white),
              ),
               TextField(
                decoration: InputDecoration(

                    labelText: 'Enter UPI ID',
                    hintText: 'Enter UPI ID'),
                    controller: upicontroller,
              ),
              ElevatedButton(
                  onPressed: () {
                    initiateTransaction(app,upicontroller.text);
                  },
                  child: Text("Pay"))
            ],
          ),
        ),
      ),
    );
  }
}
