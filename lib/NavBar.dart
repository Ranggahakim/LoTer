import 'package:flutter/material.dart';
import 'package:loter/Pages/profilePage.dart';
import 'package:loter/Pages/viewMapPage.dart';


class MainNavbar extends StatefulWidget {
  const MainNavbar({
    super.key,
  });

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {
  
  int currentPageIndex = 0; 
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
      textDirection: TextDirection.ltr,
    child: Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.book),
              icon: Icon(Icons.book_outlined),
              label: 'Belajar',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.cases_rounded),
              icon: Icon(Icons.cases_outlined), 
              label: 'Lowongan'
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.location_on), 
              icon: Icon(Icons.location_on_outlined),
              label: 'Cari',  
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.notifications),
              icon: Icon(Icons.notifications_none), 
              label: "Notifikasi"
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.account_circle),
              icon: Icon(Icons.account_circle_outlined), 
              label: 'Profile'
            )
          ]),

          body: <Widget>[
            Center(
              child: Text("Page 1, Belajar") 
              ),
            
            Center(
              child: Text("Page 2, Lowongan") 
              ),
            
            MyMaps(),

            Center(
              child: Text("Page 4, Notifikasi") 
              ),
            
            MyProfile(),

          ][currentPageIndex],
    ),
    )
    );
  }
}
