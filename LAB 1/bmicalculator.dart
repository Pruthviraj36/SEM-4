import 'dart:io';

void main(){

  print("The BMI calculator !!!");

  print("Enter your weight in pound !!");
  double? weight = double.parse(stdin.readLineSync()!);

  print("Enter your height in inch !!");
  double? height = double.parse(stdin.readLineSync()!);

  var kg = weight * 0.45359237 ;
  var meter = height * 0.254 ;

  var bmi = kg / (meter * meter) * 100;

  print("Your BMI ratio is : ${bmi}");

}
