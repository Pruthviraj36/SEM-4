import 'package:flutter/material.dart';

class lab7pro1 extends StatelessWidget {
  const lab7pro1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Demo ! Flutter" , style: TextStyle(
          color: Colors.redAccent,
          fontSize: 44,
          backgroundColor: Colors.pinkAccent,

        ),),
      ),
    );
  }
}

