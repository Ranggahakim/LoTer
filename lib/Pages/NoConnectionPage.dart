import 'package:flutter/material.dart';

class MyNoConnection extends StatelessWidget {
  const MyNoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text("No Connection"))
      )
    );
  }
}