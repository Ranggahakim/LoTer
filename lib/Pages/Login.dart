import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loter/myTheme.dart';
import 'package:google_sign_in/google_sign_in.dart';

final emailController = TextEditingController();
final passwordController = TextEditingController();

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login Page",
      theme: LoterMaterialTheme.myTheme,
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 50, 20, 50),
        child: SizedBox(
          height: 700,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
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
                margin: const EdgeInsets.only(top: 100),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: const SignInWidget(),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}

class SignInWidget extends StatelessWidget {
  const SignInWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          child: Row(
            children: [
              Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(bottom: 10),
                  child: const Text("Log In",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Inter',
                        fontSize: 24,
                        color: Colors.black,
                      ))),
            ],
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
                  // ignore: unused_local_variable
                  try {
                    await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                  } on FirebaseAuthException catch (e) {
                    //print(e.code);

                    if (e.code == 'user-not-found') {
                      //print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      //print('Wrong password provided for that user.');
                    } else if (e.code == 'invalid-email') {
                      //print("Email is INVALID");
                    } else if (e.code == 'user-disabled') {
                      //print("User disabled");
                    } else if (e.code == 'network-request-failed') {
                      return;
                    }
                  }
                },
                child: const Text("Log In",
                    style: TextStyle(color: Colors.white))),
          ),
        ),
        //Login with google
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
                  Future<UserCredential> signInWithGoogle() async {
                    // Trigger the authentication flow
                    final GoogleSignInAccount? googleUser =
                        await GoogleSignIn().signIn();

                    // Obtain the auth details from the request
                    final GoogleSignInAuthentication? googleAuth =
                        await googleUser?.authentication;

                    // Create a new credential
                    final credential = GoogleAuthProvider.credential(
                      accessToken: googleAuth?.accessToken,
                      idToken: googleAuth?.idToken,
                    );

                    // Once signed in, return the UserCredential
                    return await FirebaseAuth.instance
                        .signInWithCredential(credential);
                  }

                  //print("Google Login");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/GoogleLogo.png',
                      height: 30,
                      fit: BoxFit.cover,
                    ),
                    const Text("Log In with google",
                        style: TextStyle(color: Colors.white)),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

class EmailBox extends StatelessWidget {
  const EmailBox({super.key});

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

class PasswordBox extends StatelessWidget {
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
          obscureText: true,
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
