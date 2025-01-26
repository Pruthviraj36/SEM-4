import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class lab7pro2 extends StatelessWidget {
  const lab7pro2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: customtext(name : 'Dhairya, Viraj, Pruthviraj  ', clr : Colors.redAccent, fnt : 44, backColor : Colors.yellowAccent, fntWeight : FontWeight.w200),
    );
  }
  Widget customtext({required String name, required Color clr, required double fnt, required Color backColor, required FontWeight fntWeight}){
    return Text(name, style: TextStyle(
      color: clr,
      fontSize: fnt,
      backgroundColor: backColor,
    ),);
  }
}
