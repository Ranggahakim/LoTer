import 'package:flutter/material.dart';
import 'package:loter/Models/main_models.dart';
import 'package:loter/NavBar.dart';
import 'package:loter/main.dart';
import 'package:loter/myTheme.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class MyLogin extends StatelessWidget {
  final MainDB? mainDB;


  MyLogin({
    Key? key,
    this.mainDB
    }) : super(key: key);

    final emailController = TextEditingController();
    final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    
    if(mainDB != null)
    {
      emailController.text = mainDB!.Email;
      passwordController.text = mainDB!.Password;
    }

    return MaterialApp(
      title: "Login Page",
      theme: LoterMaterialTheme.myTheme,
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(30, 50, 20, 50),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
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
                      margin: EdgeInsets.only(left: 20),
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
                margin: EdgeInsets.only(top: 100),
              ),
              Container(
                width: MediaQuery.sizeOf(context).width,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: SignInWidget(),
              ),
              Spacer()
            ],
          ),
        );
      }),
    );
  }
}

class SignInWidget extends StatelessWidget {
  const SignInWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(margin: EdgeInsets.only(bottom: 20), child: EmailBox()),
        PasswordBox(),
        Container(
          width: MediaQuery.sizeOf(context).width,
          child: Container(
            margin: EdgeInsets.only(top: 20),
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
            ),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                onPressed: (){
                  runApp(MainNavbar());
                },
                child:
                    Text("Log In", style: TextStyle(color: Colors.white))),
          ),
        ),
      ],
    );
  }
}

class EmailBox extends MyLogin {
  EmailBox({
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

class NameBox extends MyLogin {
  NameBox({
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

class PasswordBox extends MyLogin {
  PasswordBox({
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
