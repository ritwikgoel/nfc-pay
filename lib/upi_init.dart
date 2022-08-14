import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';

class upi_trans extends StatefulWidget {
  const upi_trans({super.key});

  @override
  State<upi_trans> createState() => _upi_transState();
}

class _upi_transState extends State<upi_trans> {
  @override
  Widget build(BuildContext context) {
    Future<void> nfcFunc() async {
      Stream<NDEFMessage> stream = NFC.readNDEF();
      stream.listen((NDEFMessage message) {
        print("records: ${message.records.length}");
      });
    }

    return Scaffold(
      body: Column(
        children: [
          Text("data"),
          ElevatedButton(
              onPressed: () {
                nfcFunc();
              },
              child: Text("data"))
        ],
      ),
    );
  }
}
