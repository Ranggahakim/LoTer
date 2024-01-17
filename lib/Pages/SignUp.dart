import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:loter/myTheme.dart';

final nameController = TextEditingController();
String? userTypeText;
final emailController = TextEditingController();
final passwordController = TextEditingController();

class MySignUp extends StatelessWidget {
  const MySignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Sign Up Page",
      theme: LoterMaterialTheme.myTheme,
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        child: Container(
          height: 700,
          padding: const EdgeInsets.fromLTRB(30, 50, 20, 50),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Lowongan",
                          style:
                              Theme.of(context).primaryTextTheme.headlineLarge,
                        )),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Theme.of(context).primaryColor,
                            size: 35,
                          ),
                          Text(
                            "Terdekat",
                            style: Theme.of(context)
                                .primaryTextTheme
                                .headlineLarge,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 50),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const SignInWidget(),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class SignInWidget extends StatefulWidget {
  const SignInWidget({
    super.key,
  });

  @override
  State<SignInWidget> createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  String dropdownValue = 'User';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Material(
            child: Row(
              children: [
                Container(
                    height: 50,
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.only(bottom: 10),
                    child: const Text("Sign Up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Inter',
                          fontSize: 24,
                          color: Colors.black,
                        ))),
              ],
            ),
          ),
          Container(margin: const EdgeInsets.only(bottom: 20), child: const NameBox()),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: DropdownButtonFormField<String>(
              value: dropdownValue,
              items: <String>['User', 'Company']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                  ),
                );
              }).toList(),
              decoration: const InputDecoration(
                  labelText: 'Role',
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    // width: 0.0 produces a thin "hairline" border
                    borderSide:
                        BorderSide(color: Colors.black, width: 0.0),
                  ),
                  border: OutlineInputBorder()),
              borderRadius: BorderRadius.circular(10),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  userTypeText = newValue;
                });
              },
            ),
          ),
          Container(margin: const EdgeInsets.only(bottom: 20), child: const EmailBox()),
          const PasswordBox(),
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
                    final User? userFirebase = (await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: passwordController.text,
                    )
                            .catchError((errorMsg) {
                      //print(errorMsg);
                    }))
                        .user;

                    try {
                      userFirebase;
                    } on FirebaseAuthException catch (e) {
                      //print(e.code);
                      if (e.code == 'weak-password') {
                        //print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        //print('The account already exists for that email.');
                      }
                    } catch (e) {
                      //print(e);
                    }

                    DatabaseReference usersRef = FirebaseDatabase.instance
                        .ref()
                        .child("users")
                        .child(userFirebase!.uid);

                    userTypeText ??= "User";
                    Map userDataMap = {
                      "name": nameController.text,
                      "email": emailController.text,
                      "id": userFirebase.uid,
                      "userType": userTypeText,
                      "about": "",
                    };

                    usersRef.set(userDataMap);
                    
                  },
                  child: const Text("Sign Up",
                      style: TextStyle(color: Colors.white))),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailBox extends MySignUp {
  const EmailBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // Tambahkan widget Material untuk mengatasi error "No Material widget found"
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x34090F13),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: emailController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Email Address',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
            prefixIcon: Icon(
              Icons.mail,
              color: Colors.grey,
            ),
          ),
          //style: FlutterFlowTheme.of(context).bodyLarge,
          //validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}

class NameBox extends MySignUp {
  const NameBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // Tambahkan widget Material untuk mengatasi error "No Material widget found"
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x34090F13),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: nameController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Your Name',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
            prefixIcon: Icon(
              Icons.person,
              color: Colors.grey,
            ),
          ),
          //style: FlutterFlowTheme.of(context).bodyLarge,
          //validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}

class PasswordBox extends MySignUp {
  const PasswordBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      // Tambahkan widget Material untuk mengatasi error "No Material widget found"
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              blurRadius: 4,
              color: Color(0x34090F13),
              offset: Offset(0, 2),
            )
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: passwordController,
          obscureText: false,
          decoration: const InputDecoration(
            labelText: 'Password',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            contentPadding: EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
            prefixIcon: Icon(
              Icons.key,
              color: Colors.grey,
            ),
          ),
          //style: FlutterFlowTheme.of(context).bodyLarge,
          //validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
