import 'package:flutter/material.dart';
import 'package:loter/Pages/lowonganPage.dart';
import 'package:loter/Pages/notifikasiPage.dart';
import 'package:loter/Pages/profilePage.dart';
import 'package:loter/Pages/viewMapPage.dart';
import 'package:loter/Pages/belajarPage.dart';
import 'package:loter/myTheme.dart';

class MainNavbar extends StatefulWidget {
  const MainNavbar({
    super.key,
  });

  @override
  State<MainNavbar> createState() => _MainNavbarState();
}

class _MainNavbarState extends State<MainNavbar> {
  int currentPageIndex = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Navbar",
        debugShowCheckedModeBanner: false,
        theme: LoterMaterialTheme.myTheme,
        home: Directionality(
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (context) {
              return Scaffold(
                bottomNavigationBar: NavigationBar(
                    onDestinationSelected: (int index) {
                      setState(() {
                        currentPageIndex = index;
                      });
                    },
                    indicatorColor: Theme.of(context).primaryColor,
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
                          label: 'Lowongan'),
                      NavigationDestination(
                        selectedIcon: Icon(Icons.location_on),
                        icon: Icon(Icons.location_on_outlined),
                        label: 'Cari',
                      ),
                      NavigationDestination(
                          selectedIcon: Icon(Icons.notifications),
                          icon: Icon(Icons.notifications_none),
                          label: "Notifikasi"),
                      NavigationDestination(
                          selectedIcon: Icon(Icons.account_circle),
                          icon: Icon(Icons.account_circle_outlined),
                          label: 'Profile')
                    ]),
                body: const <Widget>[
                  MyBelajar(),
                  MyLowongan(),
                  MyMaps(),
                  MyNotification(),
                  MyProfile(),
                ][currentPageIndex],
              );
            }
          ),
        ));
  }
}
