import 'package:flutter/material.dart';
import 'package:loter/Pages/Login.dart';
import 'package:loter/Pages/authPage.dart';
import 'package:loter/myTheme.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Profile Page",
      debugShowCheckedModeBanner: false,
      theme: LoterMaterialTheme.myTheme,
      home: const SingleChildScrollView(
        child: Column(
          children: [
            //Top Profile
            TopProfile(),
            //About Me
            AboutMe(),
            //Pengalaman Kerja
            WorkHistory(),
            //Pendidikan
            EducationHistory(),
            SignOut()
          ],
        ),
      ),
    );
  }
}

class TopProfile extends StatelessWidget {
  const TopProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 205,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(20, 40, 20, 0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(
                            'assets/image/profile.png',
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  const DefaultTextStyle(
                    style: TextStyle(color: Colors.white),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nama User'),
                          Text("+62 xxx xxxx xxxx"),
                          Text('xxx@gmail.com'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: const TextStyle(fontSize: 15),
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Column(
                        children: [Text("74"), Text("Profil Dilihat")],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [Text("15"), Text("Disimpan")],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [Text("22"), Text("Lamaran")],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class EducationHistory extends StatelessWidget {
  const EducationHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.sizeOf(context).width * 0.99,
      padding: const EdgeInsets.all(15),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [BoxShadow(blurRadius: .1, color: Colors.black)],
          borderRadius: BorderRadius.circular(3)),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        //head
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pendidikan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Tambah",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              child: Column(
                children: List.generate(
                  1,
                  (index) => Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.school_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 200,
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Major",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text("University",
                                  style: TextStyle(fontSize: 14)),
                              Text("Time", style: TextStyle(fontSize: 12))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.edit_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WorkHistory extends StatelessWidget {
  const WorkHistory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.sizeOf(context).width * 0.99,
      padding: const EdgeInsets.all(15),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [BoxShadow(blurRadius: .1, color: Colors.black)],
          borderRadius: BorderRadius.circular(3)),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        //head
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pengalaman Kerja",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Tambah",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              child: Column(
                children: List.generate(
                  1,
                  (index) => Container(
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.cases_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(
                          width: 200,
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Job's Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text("Location", style: TextStyle(fontSize: 14)),
                              Text("Time", style: TextStyle(fontSize: 12))
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Icon(
                            Icons.edit_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AboutMe extends StatelessWidget {
  const AboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.sizeOf(context).width * 0.99,
      padding: const EdgeInsets.all(15),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [BoxShadow(blurRadius: .1, color: Colors.black)],
          borderRadius: BorderRadius.circular(3)),
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Tentang Saya",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            const Text(
              """ Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent fermentum sit amet urna dignissim venenatis. Sed sed nulla at nisi dictum lacinia. In vel purus a libero ultrices scelerisque ut eget risus. 
              
              Maecenas fermentum leo blandit, fringilla enim vel, faucibus arcu. Integer bibendum quam at dui placerat, ac ullamcorper purus pretium. Etiam ac laoreet dui. Suspendisse rhoncus rhoncus dolor in accumsan.""",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class SignOut extends StatelessWidget {
  const SignOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      width: MediaQuery.sizeOf(context).width * 0.99,
      padding: const EdgeInsets.all(15),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: const [BoxShadow(blurRadius: .1, color: Colors.black)],
          borderRadius: BorderRadius.circular(3)),
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            fixedSize: Size(MediaQuery.sizeOf(context).width * 0.99, 50)
          ),
          onPressed: () {
            runApp(MyAuth());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, color: Colors.white),
              Text("Log Out", style: TextStyle(color: Colors.white)),
            ],
          )),
    );
  }
}
