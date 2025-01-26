import 'dart:io';

void main(){
  stdout.write("Enter a meters : ");
  int m = int.parse(stdin.readLineSync()!);
  double f = m * 3.28;
  print("feet : $f");
}