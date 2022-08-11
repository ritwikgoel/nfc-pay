import 'package:flutter/material.dart';

import 'introScreen.dart';

void main() {
  runApp(const app());
}

class app extends StatelessWidget {
  const app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
    '/': (context) => const introScreen(),
    //'/second': (context) => const SecondScreen(),
  },
    );
  }
}

