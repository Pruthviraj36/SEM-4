import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';                                                //vir odedra

class TabViewDemo extends StatelessWidget {
  const TabViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> name = [
      "Jasmin",
      "Viraj",
      "Pruthviraj",
      "Dhairya",
      "Meet",
      "MAnav",
      "Harshil"
    ];
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  child: (Text('First Slide')),
                ),
                Tab(
                  child: (Text('Secon Slide')),
                ),
                Tab(
                  child: (Text('Third Slide')),
                ),
                Tab(
                  child: (Text('Forth Slide')),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              color: Colors.redAccent,
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.white,
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.lightBlueAccent,
                            )),
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              color: Colors.green,
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.blueAccent,
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.brown,
                            )),
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  color: Colors.yellowAccent,
                                )),
                            Expanded(
                                child: Container(
                              color: Colors.black,
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.yellow,
                            )),
                          ],
                        ))
                      ],
                    )),
                    Expanded(
                        child: Column(
                      children: [
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Container(
                                  color: Colors.cyan,
                                )),
                            Expanded(
                                child: Container(
                              color: Colors.yellowAccent,
                            ))
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              color: Colors.purpleAccent,
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.black26,
                            )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.green,
                                )),
                            Expanded(
                                child: Container(
                              color: Colors.cyanAccent,
                            )),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.pink,
                                ))
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                                child: Container(
                              color: Colors.brown,
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.black26,
                            )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  color: Colors.pinkAccent,
                                ))
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.lightGreenAccent,
                                )),
                            Expanded(
                                child: Container(
                              color: Colors.blue[200],
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.yellow,
                            ))
                          ],
                        )),
                        Expanded(
                            child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              color: Colors.pinkAccent,
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.greenAccent,
                            )),
                            Expanded(
                                child: Container(
                              color: Colors.blueAccent,
                            )),
                          ],
                        ))
                      ],
                    ))
                  ],
                ),
              ),
              Center(
                child: Column(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              color: Colors.brown,
                            )),
                        Expanded(
                            child: Container(
                          color: Colors.cyan,
                        ))
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: Colors.yellowAccent,
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  color: Colors.cyan[200],
                                )),
                                Expanded(
                                    child: Container(
                                  color: Colors.blueGrey[200],
                                ))
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  color: Colors.purpleAccent[200],
                                )),
                                Expanded(
                                    child: Container(
                                  color: Colors.red[200],
                                ))
                              ],
                            )),
                          ],
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.blue[500],
                        ))
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          color: Colors.black,
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.white,
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.black,
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.white,
                        ))
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  color: Colors.blue,
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          color: Colors.yellow,
                                        )),
                                        Expanded(
                                            child: Container(
                                          color: Colors.purple,
                                        ))
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          color: Colors.green,
                                        )),
                                        Expanded(
                                            child: Container(
                                          color: Colors.pink,
                                        ))
                                      ],
                                    ))
                                  ],
                                ))
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  color: Colors.pink,
                                )),
                                Expanded(
                                    child: Container(
                                  color: Colors.orange,
                                ))
                              ],
                            ))
                          ],
                        )),
                        Expanded(
                            child: Container(
                          color: Colors.blue[100],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  color: Colors.blue,
                                )),
                                Expanded(
                                    child: Column(
                                  children: [
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          color: Colors.yellow,
                                        )),
                                        Expanded(
                                            child: Container(
                                          color: Colors.purple,
                                        ))
                                      ],
                                    )),
                                    Expanded(
                                        child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                          color: Colors.green,
                                        )),
                                        Expanded(
                                            child: Container(
                                          color: Colors.grey,
                                        ))
                                      ],
                                    ))
                                  ],
                                ))
                              ],
                            )),
                            Expanded(
                                child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  color: Colors.pink,
                                )),
                                Expanded(
                                    child: Container(
                                  color: Colors.orange,
                                ))
                              ],
                            ))
                          ],
                        )),
                      ],
                    ))
                  ],
                ),
              ),
              SlideInLeft(
                child: ListView.builder(
                    itemCount: name.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: FadeInRightBig(
                          child: Container(
                            height: 100,
                            color: Colors.redAccent,
                            child: Text(
                              "Name of JOD's are : ${name[index]}",
                              style: TextStyle(fontSize: 32),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Center(
                child: Text('First'),
              ),
            ],
          ),
        ));
  }
}
