import 'dart:io';
void main(){
  double f = double.parse(stdin.readLineSync()!);
  double c = (f-32)*5/9;
  print("celsius : $c");
}