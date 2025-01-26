import 'package:flutter/material.dart';

class lab7pro3 extends StatefulWidget {
  const lab7pro3({super.key});

  @override
  State<lab7pro3> createState() => _lab7pro3State();
}

class _lab7pro3State extends State<lab7pro3> {
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('textField Example !!'),
      ),
      body: Column(
        children: [
          TextField(
            controller: name,
          ),

          ElevatedButton(onPressed: (){
            setState(() {

            });
          }, child: Text('Submit !')),
          Text(name.text)
        ],
      ),
    );
  }
}
