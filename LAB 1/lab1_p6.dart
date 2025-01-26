import 'dart:io';

void main(){
  stdout.write("enter w : ");
  double weightinpound = double.parse(stdin.readLineSync()!);

  stdout.write("enter h : ");
  double heightininches = double.parse(stdin.readLineSync()!);

  double weightinkg = weightinpound * 0.45359237;
  double heightinmeter = heightininches * 0.254;

  stdout.write("weight in kg : ");
  print(weightinkg);

  stdout.write("height in m : ");
  print(heightinmeter);

}