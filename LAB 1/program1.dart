import 'dart:io';
void main(){
  print("Hello world");

  int a = int.parse(stdin.readLineSync()!);
  int b = int.parse(stdin.readLineSync()!);
  print("sum : ${a+b}");
}