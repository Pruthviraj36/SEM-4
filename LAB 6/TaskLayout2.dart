import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class extralayout extends StatelessWidget {
  const extralayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hard Layout !!'),
      ),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.yellowAccent,
              )),
              Expanded(child: Column(
                 children: [
                   Expanded(child: Row(
                     children: [
                       Expanded(child: Container(
                         color: Colors.cyanAccent,
                       )),
                       Expanded(child: Container(
                         color: Colors.blueAccent,
                       )),
                     ],
                   )),
                   Expanded(child: Row(
                     children: [
                       Expanded(child: Container(
                         color: Colors.purpleAccent,
                       )),
                       Expanded(child: Container(
                         color: Colors.redAccent  ,
                       )),
                     ],
                   ))
                 ],
              )),

            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.white60,
              )),
              Expanded(child: Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      Expanded(flex: 2,child: Container(
                        color: Colors.blueAccent[200],
                      )),
                      Expanded(child: Expanded(flex: 1, child: Container(
                        color: Colors.blueGrey[200],
                      ))),
                      Expanded(child: Expanded(flex: 0,child: Container(
                        color: Colors.orange[400],
                      )))
                    ],
                  )),
                  Expanded(child: Column(
                    children: [
                      Expanded(child: Container(
                        color: Colors.purpleAccent[100],
                      )),
                      Expanded(child: Container(
                        color: Colors.purpleAccent,
                      )),
                      Expanded(child: Container(
                        color: Colors.grey,
                      ))
                    ],
                  )),
                  Expanded(child: Column(
                    children: [
                      Expanded(flex: 3,child: Container(
                        color: Colors.cyan[100],
                      )),
                      Expanded(flex: 3,child: Container(
                        color: Colors.green[100],
                      )),
                      Expanded(flex: 3,child: Container(
                        color: Colors.purple[100],
                      ))
                    ],
                  )),

                ],
              )),
              Expanded(child: Container(
                color: Colors.yellowAccent,
              )),
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                color: Colors.deepOrange,
              )),
              Expanded(child: Container(
                color: Colors.green,
              )),
              Expanded(child: Container(
                color: Colors.purple,
              )),
            ],
          )),
        ],
      ),
    );
  }
}
