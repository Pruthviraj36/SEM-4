import 'dart:io';

void main(){
  print("Enter the first number :");
  int? num1 = int.parse(stdin.readLineSync()!);

  print("Enter the second number :");
  int? num2 = int.parse(stdin.readLineSync()!);

  print("Enter the third number :");
  int? num3 = int.parse(stdin.readLineSync()!);

    if(num1 > num2 && num1 > num3){
      print("$num1 is largest number !");
    }
    else if(num2 > num1 && num2 > num3){
      print("$num2 is largest number !");
    }
    else{
      print("$num3 is largest number !");
    }

}