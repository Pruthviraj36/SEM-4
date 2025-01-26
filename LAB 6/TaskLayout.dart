import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class task extends StatelessWidget {
  const task({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom layout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.blue  ,
                  ),
                ),
              ],
            )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex : 3,
                  child: Container(
                    color: Colors.lightBlueAccent,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(child: Container(
                        color: Colors.purpleAccent,
                        ),
                      ),
                      Expanded(child: Container(
                        color: Colors.yellow,
                        ),
                      )
                    ],
                  )
                )
              ],
            )
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.yellowAccent,
                    ),
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.blueAccent
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
