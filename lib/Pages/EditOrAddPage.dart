import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loter/NavBar.dart';
import 'package:loter/Pages/profilePage.dart';
import 'package:loter/myTheme.dart';
import 'package:uuid/uuid.dart';

final aboutController = TextEditingController();

late BuildContext mainContext;

String? purposeID;

class MyEditOrAdd extends StatefulWidget {
  const MyEditOrAdd(
      {super.key,
      required this.title,
      required this.pagePurpose,
      required this.ID});

  final String title;
  final String pagePurpose;
  final String ID;

  @override
  State<MyEditOrAdd> createState() => _MyEditOrAddState();
}

class _MyEditOrAddState extends State<MyEditOrAdd> {
  @override
  void initState() {
    super.initState();
    purposeID = widget.ID;
  }

  @override
  Widget build(BuildContext context) {
    mainContext = context;
    return MaterialApp(
      title: "Edit or Add Page",
      debugShowCheckedModeBanner: false,
      theme: LoterMaterialTheme.myTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(mainContext);
                  },
                  child: const Text("<")),
              const Spacer(
                flex: 1,
              ),
              Text(widget.title),
              const Spacer(
                flex: 2,
              )
            ],
          ),
        ),
        body: Center(
          child: Builder(builder: (context) {
            if (widget.pagePurpose == 'about') {
              return const EditMyAbout();
            } else if (widget.pagePurpose == 'job') {
              return AddJob();
            } else if (widget.pagePurpose == 'education') {
              return AddEducation();
            } else if (widget.pagePurpose == 'editJob') {
              return const EditJob();
            } else if(widget.pagePurpose == 'editEducation'){
              return const EditEducation();
            }
            return const Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}

class EditMyAbout extends StatelessWidget {
  const EditMyAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      TextFormField(
        controller: aboutController,
        obscureText: false,
        decoration: const InputDecoration(
          labelText: 'About',
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
        ),
      ),
      SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
          ),
          child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () async {
                // ignore: unused_local_variable

                String? userID = FirebaseAuth.instance.currentUser?.uid;

                final Map<String, String> updates = {};
                updates['users/$userID/about'] = aboutController.text;

                thisAccountAbout = aboutController.text;

                FirebaseDatabase.instance.ref().update(updates);

                Navigator.pushReplacement(
                  mainContext,
                  MaterialPageRoute(
                      builder: (mainContext) => const MyProfile()),
                );
              },
              child: const Text("Edit About",
                  style: TextStyle(color: Colors.white))),
        ),
      ),
    ]);
  }
}

class AddJob extends StatelessWidget {
  AddJob({super.key});

  final jobNameController = TextEditingController();
  final jobLocationController = TextEditingController();
  final jobTimeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 100),
            child: const Text(
              "Tambah Pekerjaan",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            )),
        TextFormField(
          controller: jobNameController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Nama pekerjaan',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        TextFormField(
          controller: jobLocationController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Lokasi',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        TextFormField(
          controller: jobTimeController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Waktu',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  // ignore: unused_local_variable

                  String? userID = FirebaseAuth.instance.currentUser?.uid;

                  String jobID = const Uuid().v1();

                  DatabaseReference usersRef = FirebaseDatabase.instance
                      .ref()
                      .child("Jobs")
                      .child(userID!)
                      .child(jobID.toString());

                  Map userDataMap = {
                    "jobName": jobNameController.text,
                    "jobLocation": jobLocationController.text,
                    "jobTime": jobTimeController.text,
                    "userID": userID,
                    "jobID": jobID
                  };

                  usersRef.set(userDataMap);

                  Navigator.pushReplacement(
                    mainContext,
                    MaterialPageRoute(
                        builder: (mainContext) => const MyProfile()),
                  );
                },
                child:
                    const Text("Add", style: TextStyle(color: Colors.white))),
          ),
        ),
      ]),
    );
  }
}

class EditJob extends StatefulWidget {
  const EditJob({super.key});

  @override
  State<EditJob> createState() => _EditJobState();
}

class _EditJobState extends State<EditJob> {
  final jobEditNameController = TextEditingController();

  final jobEditLocationController = TextEditingController();

  final jobEditTimeController = TextEditingController();

  final String? userID = FirebaseAuth.instance.currentUser?.uid;
  @override
  void initState() {
    super.initState();
    updateText();
  }

  void updateText() async {
    final jobDB = await FirebaseDatabase.instance
        .ref()
        .child('Jobs/$userID/$purposeID')
        .get();

    //print(jobDB.child('jobName').value.toString());

    jobEditNameController.text = jobDB.child('jobName').value.toString();
    jobEditLocationController.text =
        jobDB.child('jobLocation').value.toString();
    jobEditTimeController.text = jobDB.child('jobTime').value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 100),
            child: const Text(
              "Edit Pekerjaan",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            )),
        TextFormField(
          controller: jobEditNameController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Nama pekerjaan',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        TextFormField(
          controller: jobEditLocationController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Lokasi',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        TextFormField(
          controller: jobEditTimeController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Waktu',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  // ignore: unused_local_variable

                  final Map<String, String> updates = {};
                  updates['Jobs/$userID/$purposeID/jobName'] =
                      jobEditNameController.text;
                  updates['Jobs/$userID/$purposeID/jobLocation'] =
                      jobEditLocationController.text;
                  updates['Jobs/$userID/$purposeID/jobTime'] =
                      jobEditTimeController.text;

                  FirebaseDatabase.instance.ref().update(updates);

                  Navigator.pushReplacement(
                    mainContext,
                    MaterialPageRoute(
                        builder: (mainContext) => const MyProfile()),
                  );
                },
                child:
                    const Text("Add", style: TextStyle(color: Colors.white))),
          ),
        ),
      ]),
    );
  }
}

class AddEducation extends StatelessWidget {
  AddEducation({super.key});

  final educationNameController = TextEditingController();
  final educationUniversityController = TextEditingController();
  final educationTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 100),
            child: const Text(
              "Tambah Pendidikan",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            )),
        TextFormField(
          controller: educationNameController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Nama Jurusan',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        TextFormField(
          controller: educationUniversityController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Universitas',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        TextFormField(
          controller: educationTimeController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Waktu',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  // ignore: unused_local_variable

                  String? userID = FirebaseAuth.instance.currentUser?.uid;

                  String educationID = const Uuid().v1();

                  DatabaseReference usersRef = FirebaseDatabase.instance
                      .ref()
                      .child("educations")
                      .child(userID!)
                      .child(educationID.toString());

                  Map userDataMap = {
                    "EducationName": educationNameController.text,
                    "EducationUniversity": educationUniversityController.text,
                    "EducationTime": educationTimeController.text,
                    "userID": userID,
                    "educationID": educationID
                  };

                  usersRef.set(userDataMap);

                  Navigator.pushReplacement(
                    mainContext,
                    MaterialPageRoute(
                        builder: (mainContext) => const MyProfile()),
                  );
                },
                child:
                    const Text("Add", style: TextStyle(color: Colors.white))),
          ),
        ),
      ]),
    );
  }
}

class EditEducation extends StatefulWidget {
  const EditEducation({super.key});

  @override
  State<EditEducation> createState() => _EditEducationState();
}

class _EditEducationState extends State<EditEducation> {
  final educationeditNameController = TextEditingController();

  final educationeditUniversityController = TextEditingController();

  final educationeditTimeController = TextEditingController();

  String? userID = FirebaseAuth.instance.currentUser?.uid;
  @override
  void initState() {
    super.initState();
    updateText();
  }

  void updateText() async {
    final jobDB = await FirebaseDatabase.instance
        .ref()
        .child('educations/$userID/$purposeID')
        .get();

    //print(jobDB.child('EducationName').value.toString());

    educationeditNameController.text = jobDB.child('EducationName').value.toString();
    educationeditUniversityController.text =
        jobDB.child('EducationUniversity').value.toString();
    educationeditTimeController.text = jobDB.child('EducationTime').value.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 100),
            child: const Text(
              "Tambah Pendidikan",
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            )),
        TextFormField(
          controller: educationeditNameController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Nama Jurusan',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        TextFormField(
          controller: educationeditUniversityController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Universitas',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        TextFormField(
          controller: educationeditTimeController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Waktu',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  final Map<String, String> updates = {};
                  updates['educations/$userID/$purposeID/EducationName'] =
                      educationeditNameController.text;
                  updates['educations/$userID/$purposeID/EducationUniversity'] =
                      educationeditUniversityController.text;
                  updates['educations/$userID/$purposeID/EducationTime'] =
                      educationeditTimeController.text;

                  FirebaseDatabase.instance.ref().update(updates);

                  Navigator.pushReplacement(
                    mainContext,
                    MaterialPageRoute(
                        builder: (mainContext) => const MyProfile()),
                  );
                },
                child:
                    const Text("Add", style: TextStyle(color: Colors.white))),
          ),
        ),
      ]),
    );
  }
}
