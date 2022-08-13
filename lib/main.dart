import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nfcpay/login_page.dart';
import 'package:nfcpay/signup.dart';

import 'introScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const app());
}

final navigatorkey = GlobalKey<NavigatorState>();

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      initialRoute: '/',
      routes: {
        '/': (context) => const introScreen(),
        '/login': (context) => const login_page(),
        '/signup': (context) => const signup(),
      },
    );
  }
}
