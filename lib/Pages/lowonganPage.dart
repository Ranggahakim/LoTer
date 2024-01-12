import 'package:flutter/material.dart';
import 'package:loter/myTheme.dart';

class MyLowongan extends StatefulWidget {
  const MyLowongan({super.key});

  @override
  State<MyLowongan> createState() => _MyLowonganState();
}

class _MyLowonganState extends State<MyLowongan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LoterMaterialTheme.myTheme,
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 125,
          title: // Generated code for this Container Widget...
              Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
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
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                    child: TextFormField(
                      //controller: _model.textController,
                      //focusNode: _model.textFieldFocusNode,
                      obscureText: false,
                      decoration: const InputDecoration(
                        labelText: 'Find your task...',
                        //labelStyle: FlutterFlowTheme.of(context).labelLarge,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        focusedErrorBorder: InputBorder.none,
                        contentPadding:
                            EdgeInsetsDirectional.fromSTEB(24, 12, 12, 12),
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          color: Colors.grey,
                        ),
                      ),
                      //style: FlutterFlowTheme.of(context).bodyLarge,
                      //validator: _model.textControllerValidator.asValidator(context),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Theme.of(context).primaryColor,
                      size: 16,
                    ),
                    const Text(
                      "Bandung, Jawa Barat",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[JobsList()],
          ),
        ),
      ),
    );
  }
}

class JobsList extends StatelessWidget {
  const JobsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 4),
          child: Container(
            height: 175,
            width: MediaQuery.sizeOf(context).width * 0.96,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 4, color: Colors.black, offset: Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(16)),
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Text("Photo"),
                      Container(
                        width: 200,
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              margin: const EdgeInsets.only(top: 1),
                              child: const Text(
                                "Job's Name",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "Office Name",
                                style: TextStyle(
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.money),
                        ),
                        const Text(
                          "Rp. xx.xxx.xxx - Rp. xx.xxx.xxx/bulan",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin:const  EdgeInsets.only(top: 5),
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          child: const Icon(Icons.location_on),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "Location",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        const Text("xxKm")
                      ],
                    ),
                  ),
                  DefaultTextStyle(
                    style: const TextStyle(
                        color: Color.fromARGB(255, 151, 151, 151),
                        fontSize: 10),
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            height: 30,
                            width: 90,
                            margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 243, 243, 243),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: const Icon(Icons.cases_outlined,
                                        size: 12,
                                        color: Color.fromARGB(
                                            255, 151, 151, 151))),
                                const Text("1 - 3 Tahun"),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 75,
                            margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 243, 243, 243),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                                    child: const Icon(Icons.account_circle_outlined,
                                        size: 12,
                                        color: Color.fromARGB(
                                            255, 151, 151, 151))),
                                const Text("16 Tahun"),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            width: 120,
                            margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 243, 243, 243),
                                borderRadius: BorderRadius.circular(6)),
                            child: Row(
                              children: [
                                Container(
                                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: const Icon(Icons.account_circle_outlined,
                                        size: 12,
                                        color: Color.fromARGB(
                                            255, 151, 151, 151))),
                                const Text("Minimal SMA/MA"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
