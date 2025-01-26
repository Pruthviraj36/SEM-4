import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testapp/labs/lab9/bday/program1screen.dart';
import 'package:testapp/labs/lab9/program1screen.dart';

class Bdaycard extends StatefulWidget {
  Bdaycard({super.key});

  @override
  State<Bdaycard> createState() => _bdaycardState();
}

class _bdaycardState extends State<Bdaycard> {
  @override
  TextEditingController nameController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("Enter Your Name :", style: TextStyle(
            color: Colors.redAccent,
            backgroundColor: Colors.yellow,
            fontSize: 25
          ),),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Name',
                hintText: 'Enter Name',
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            String name = nameController.text;
            Navigator.push(context, MaterialPageRoute(builder: (context) => BdayCardDemo(name : name)));
          } ,child: Text('Submit'))
        ],
      ),
    );
  }
}
