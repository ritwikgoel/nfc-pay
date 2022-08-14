import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nfc_manager/nfc_manager.dart';

class upi_trans extends StatefulWidget {
  const upi_trans({super.key});

  @override
  State<upi_trans> createState() => _upi_transState();
}

class _upi_transState extends State<upi_trans> {
  @override
  Widget build(BuildContext context) {
    Future<void> nfcFunc() async {
      bool isNFCAvailable = await NfcManager.instance.isAvailable();
      if (isNFCAvailable == true) {
        NfcManager.instance.startSession(
          onDiscovered: (NfcTag tag) async {
            print(tag.data.values);
            NfcManager.instance.stopSession();
          },
        );
      }
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
