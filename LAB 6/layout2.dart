import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class layout2 extends StatelessWidget {
  const layout2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Layout !!'),
      ),
      body: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex : 1,
                  child: Container(
                    color: Colors.white70,
                  )
                ),
                Expanded(
                    child: Container(
                      color: Colors.deepOrange,
                    )
                ),
                Expanded(
                  flex : 2,
                    child: Container(
                      color: Colors.blueAccent,
                    )
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                  flex : 3,
                    child: Container(
                      color: Colors.brown,
                    )
                ),
                Expanded(
                  flex: 2 ,
                    child: Container(
                      color: Colors.greenAccent,
                    )
                ),
                Expanded(
                    child: Container(
                      color: Colors.white60,
                    )
                )
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Expanded(
                    child: Container(
                      color: Colors.orange,
                    )
                ),
                Expanded(
                  flex: 3,
                    child: Container(
                      color: Colors.yellowAccent,
                    )
                ),
                Expanded(
                  flex: 2,
                    child: Container(
                      color: Colors.purple,
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
