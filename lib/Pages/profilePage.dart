import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:loter/Pages/EditOrAddPage.dart';
import 'package:loter/Pages/Login.dart';
import 'package:loter/Pages/authPage.dart';
import 'package:loter/myTheme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:loter/NavBar.dart';

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
        child: SizedBox(
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
          mainAxisAlignment: MainAxisAlignment.center,
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
                  DefaultTextStyle(
                    style: const TextStyle(color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(thisAccountName),
                          Text(thisAccountEmail),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //DefaultTextStyle(
            //  style: const TextStyle(fontSize: 15),
            //  child: Container(
            //    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            //    child: const Row(
            //      mainAxisAlignment: MainAxisAlignment.spaceAround,
            //      children: [
            //        Center(
            //          child: Column(
            //            children: [Text("74"), Text("Profil Dilihat")],
            //          ),
            //        ),
            //        Center(
            //          child: Column(
            //            children: [Text("15"), Text("Disimpan")],
            //          ),
            //        ),
            //        Center(
            //          child: Column(
            //            children: [Text("22"), Text("Lamaran")],
            //          ),
            //        ),
            //      ],
            //    ),
            //  ),
            //)
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
                  TextButton(
                      child: Text(
                        "Edit",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyEditOrAdd(
                                      title: 'Edit',
                                      pagePurpose: 'about',
                                      ID: "",
                                    )));
                      }),
                ],
              ),
            ),
            Text(
              thisAccountAbout,
              style: const TextStyle(fontSize: 12),
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
      height: 200,
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
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pengalaman Kerja",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  TextButton(
                      child: Text(
                        "Tambah",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyEditOrAdd(
                                      title: 'Tambah',
                                      pagePurpose: 'job',
                                      ID: "",
                                    )));
                      }),
                ],
              ),
            ),
            Expanded(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance.ref('Jobs/$userID'),
                  itemBuilder: (context, snapshot, animation, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.cases_rounded,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  snapshot.child('jobName').value.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Text(
                                    snapshot
                                        .child('jobLocation')
                                        .value
                                        .toString(),
                                    style: const TextStyle(fontSize: 14)),
                                Text(snapshot.child('jobTime').value.toString(),
                                    style: const TextStyle(fontSize: 12))
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(left: 20),
                            child: IconButton(
                                icon: Icon(
                                  Icons.edit_rounded,
                                  color: Theme.of(context).primaryColor,
                                ),
                                tooltip: 'Edit Pekerjaan',
                                onPressed: () {
                                  String id =
                                      snapshot.child('jobID').value.toString();
                                  //print(id);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyEditOrAdd(
                                                title: 'Edit',
                                                pagePurpose: 'editJob',
                                                ID: id,
                                              )));
                                }),
                          )
                        ],
                      ),
                    );
                  },
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
      height: 200,
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
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Pendidikan",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  TextButton(
                      child: Text(
                        "Tambah",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyEditOrAdd(
                                      title: 'Tambah',
                                      pagePurpose: 'education',
                                      ID: "",
                                    )));
                      }),
                ],
              ),
            ),
            Expanded(
              child: DefaultTextStyle(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                child: FirebaseAnimatedList(
                  query: FirebaseDatabase.instance.ref('educations/$userID'),
                  itemBuilder: (context, snapshot, animation, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.school_outlined,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: 200,
                            height: 50,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  snapshot
                                      .child('EducationName')
                                      .value
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                Flexible(
                                  child: Text(
                                      snapshot
                                          .child('EducationUniversity')
                                          .value
                                          .toString(),
                                      style: const TextStyle(fontSize: 14)),
                                ),
                                Text(
                                    snapshot
                                        .child('EducationTime')
                                        .value
                                        .toString(),
                                    style: const TextStyle(fontSize: 12))
                              ],
                            ),
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.topCenter,
                            margin: const EdgeInsets.only(left: 20),
                            child: IconButton(
                              icon: Icon(
                                Icons.edit_rounded,
                                color: Theme.of(context).primaryColor,
                              ),
                              tooltip: 'Edit Pendidikan',
                              onPressed: () {
                                String id =
                                    snapshot.child('educationID').value.toString();
                                //print(id);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyEditOrAdd(
                                              title: 'Edit',
                                              pagePurpose: 'editEducation',
                                              ID: id,
                                            )));
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
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
              fixedSize: Size(MediaQuery.sizeOf(context).width * 0.99, 50)),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const MyAuth()));
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.logout, color: Colors.white),
              Text("Log Out", style: TextStyle(color: Colors.white)),
            ],
          )),
    );
  }
}
