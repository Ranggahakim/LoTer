import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loter/NavBar.dart';
import 'package:loter/Pages/Login.dart';
import 'package:loter/Pages/SignUp.dart';
import 'package:loter/myTheme.dart';

class MyAuth extends StatefulWidget {
  const MyAuth({super.key});

  @override
  State<MyAuth> createState() => _MyAuthState();
}

class _MyAuthState extends State<MyAuth> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AuthPage",
      debugShowCheckedModeBanner: false,
      theme: LoterMaterialTheme.myTheme,
      home: Scaffold(
          body: StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  
                  return const MainNavbar();
                } else {
                  return const AuthNavbar();
                }
              })),
    );
  }
}

class AuthNavbar extends StatefulWidget {
  const AuthNavbar({
    super.key,
  });

  @override
  State<AuthNavbar> createState() => _AuthNavbarState();
}

class _AuthNavbarState extends State<AuthNavbar> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
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
                    label: 'Login',
                  ),
                  NavigationDestination(
                      selectedIcon: Icon(Icons.cases_rounded),
                      icon: Icon(Icons.cases_outlined),
                      label: 'Sign In')
                ]),
            body: [
              const MyLogin(),
              const MySignUp(),
            ][currentPageIndex],
          );
        },
      ),
    );
  }
}
