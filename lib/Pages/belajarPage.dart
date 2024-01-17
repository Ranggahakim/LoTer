import 'package:flutter/material.dart';
import 'package:loter/myTheme.dart';

class MyBelajar extends StatefulWidget {
  const MyBelajar({super.key});

  @override
  State<MyBelajar> createState() => _MyBelajarState();
}

class _MyBelajarState extends State<MyBelajar> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LoterMaterialTheme.myTheme,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: const Center(
              child: Text(
                'Belajar',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                text: "Gratis",
              ),
              Tab(
                text: "Premium",
              )
            ]),
          ),
          body: TabBarView(children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                    child: Text('Video Pembelajaran',style: TextStyle(fontSize: 20, color: Colors.black),),
                  ),
                  // Generated code for this Container Widget...
                  const GratisSection(),
                  // Generated code for this Text Widget...
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'TryOut Gratis',
                            style: TextStyle(fontSize: 18, color: Colors.black,), textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: const Text(
                            'Mempersiapkan diri dari awal sebelum bekerja!',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SingleChildScrollView(
                    child: Column(
                      children: <Widget>[TryOutList()],
                    ),
                  )
                ],
              ),
            ),
            const Center(
              child: Text("Premium", style: TextStyle(fontSize: 32)),
            )
          ]),
        ),
      ),
    );
  }
}

class GratisSection extends StatelessWidget {
  const GratisSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 225,
      decoration: const BoxDecoration(
        color: Color(0xFFF1F5F8),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        primary: false,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          2,
          (index) => const VideoPembelajaran(),
        ),
      ),
    );
  }
}

class VideoPembelajaran extends StatelessWidget {
  const VideoPembelajaran({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 12),
        child: Container(
          width: 230,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x34090F13),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: double.infinity,
                height: 140,
                decoration: const BoxDecoration(
                  color: Color(0xFFF1B49B),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      'https://picsum.photos/seed/309/600',
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // Generated code for this Row Widget...
              Container(
                padding: const EdgeInsets.all(10),
                child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Title",
                      ),
                      Text("Description")
                    ]),
              )
            ],
          ),
        ));
  }
}

class TryOutList extends StatelessWidget {
  const TryOutList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        2,
        (index) => Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 4),
          child: Container(
            height: 175,
            width: MediaQuery.sizeOf(context).width * 0.96,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                      blurRadius: 4, color: Colors.black, offset: Offset(0, 2))
                ],
                borderRadius: BorderRadius.circular(0)),
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 1),
                        child: const Text(
                          "TryOut Name",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      const Text(
                        "tag",
                        style: TextStyle(
                          fontSize: 12,
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
                          child: const Icon(Icons.lock_clock),
                        ),
                        const Text(
                          "1 Hour Video",
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
                          child: const Icon(Icons.menu_book),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: const Text(
                            "15 Questions",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
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
                                    child: const Icon(Icons.verified_user_outlined,
                                        size: 12,
                                        color: Color.fromARGB(
                                            255, 151, 151, 151))),
                                const Text("Efective"),
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
                                    child: const Icon(Icons.star,
                                        size: 12,
                                        color: Color.fromARGB(
                                            255, 151, 151, 151))),
                                const Text("4.5"),
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
                                    child: const Icon(Icons.people,
                                        size: 12,
                                        color: Color.fromARGB(
                                            255, 151, 151, 151))),
                                const Text("1000+ Participant"),
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
