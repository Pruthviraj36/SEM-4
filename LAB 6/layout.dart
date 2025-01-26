import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class layout extends StatelessWidget {
  const layout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LAB-6 LAYOUT USING COLUMN"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.greenAccent
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blueAccent,
                  ),
                )
              ],
            )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.brown,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.blueGrey
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.purpleAccent,
                    ),
                  )
                ],
              )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black12,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.pinkAccent
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.orangeAccent,
                    ),
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
