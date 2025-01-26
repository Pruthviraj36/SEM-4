import 'dart:io';

void main(){
  print("Enter the first number :");
  int? num1 = int.parse(stdin.readLineSync()!);

  print("Enter the second number :");
  int? num2 = int.parse(stdin.readLineSync()!);

  print("Enter the third number :");
  int? num3 = int.parse(stdin.readLineSync()!);

  // ((num1 > num2) ? ((num1 > num3) ? print("$num1 is the largets number")) : ((num2 > num3) ? print("$num2 is the largets number") : print("$num3 is the largets number"));

  ((num1 > num2) ? ((num1 > num3) ? print("$num1 is largest number") : print("$num3 is largest number")) : ((num2 > num3) ? print("$num2 is largest number") : print("$num3 is largest number")) );

}
