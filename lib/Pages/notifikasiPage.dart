import 'package:flutter/material.dart';
import 'package:loter/myTheme.dart';

class MyNotification extends StatelessWidget {
  const MyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text("Pemberitahuan")),
            backgroundColor: Theme.of(context).primaryColor,
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                text: "Aktivitas",
              ),
              Tab(
                text: "Info",
              )
            ]),
          ),
        ),
      ),
    );
  }
}
