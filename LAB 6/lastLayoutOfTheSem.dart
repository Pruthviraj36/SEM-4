import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lastlayout extends StatelessWidget {
  const lastlayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Finally, This is last layout ! ('Vir !')' , style: TextStyle(
          color: Colors.red,
          backgroundColor: Colors.yellow
        ),),
      ),
      body: Row(
        children: [
          Expanded(child: Column(
            children: [
              Expanded(child: Column(
                children: [
                  Expanded(child: Container(
                    color: Colors.redAccent,
                  )),
                  Expanded(child: Container(
                    color: Colors.white,
                  )),
                  Expanded(child: Container(
                    color: Colors.lightBlueAccent,
                  )),
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(child: Container(
                    color: Colors.green,
                  )),
                  Expanded(child: Container(
                    color: Colors.blueAccent,
                  )),
                  Expanded(child: Container(
                    color: Colors.brown,
                  )),
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(flex: 3,child: Container(
                    color: Colors.yellowAccent,
                  )),
                  Expanded(child: Container(
                    color: Colors.black,
                  )),
                  Expanded(child: Container(
                    color: Colors.yellow,
                  )),
                ],
              ))
            ],
          )),
          Expanded(child: Column(
            children: [
              Expanded(child: Row(
                children: [
                  Expanded(flex: 3,child: Container(
                    color: Colors.cyan,
                  )),
                  Expanded(child: Container(
                    color: Colors.yellowAccent,
                  ))
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(child: Container(
                    color: Colors.purpleAccent,
                  )),
                  Expanded(child: Container(
                    color: Colors.black26,
                  )),
                  Expanded(flex: 2,child: Container(
                    color: Colors.green,
                  )),
                  Expanded(child: Container(
                    color: Colors.cyanAccent,
                  )),
                  Expanded(flex: 2,child: Container(
                    color: Colors.pink,
                  ))
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(child: Container(
                    color: Colors.brown,
                  )),
                  Expanded(child: Container(
                    color: Colors.black26,
                  )),
                  Expanded(flex: 3, child: Container(
                    color: Colors.pinkAccent,
                  ))
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(flex: 2,child: Container(
                    color: Colors.lightGreenAccent,
                  )),
                  Expanded(child: Container(
                    color: Colors.blue[200],
                  )),
                  Expanded(child: Container(
                    color: Colors.yellow,
                  ))
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(child: Container(
                    color: Colors.pinkAccent,
                  )),
                  Expanded(child: Container(
                    color: Colors.greenAccent,
                  )),
                  Expanded(child: Container(
                    color: Colors.blueAccent,
                  )),

                ],
              ))
            ],
          ))
        ],
      ),
    );
  }
}
