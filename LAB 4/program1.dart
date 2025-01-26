import 'dart:io';
void main(){

  print("Enter the P, is the principal amount");
  double principal = double.parse(stdin.readLineSync()!);
  print("Enter the R, is rate of intrest");
  double rate = double.parse(stdin.readLineSync()!);
  print("Enter the T, is the time ");
  double time = double.parse(stdin.readLineSync()!);

  double ans = calculateIntrest(principal, rate, time);
  print("The simple intrest is $ans ");

}

double calculateIntrest(double? p, double? r, double? t){

  return ( p! * r! * t!)/100;

}
