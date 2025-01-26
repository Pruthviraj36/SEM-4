import 'dart:io';

void main(){
  print("Enter the first number :");
  int facto = int.parse(stdin.readLineSync()!);

 int sum = 1;

  for(int i = 1; i <= facto; i++){
    sum *= i;

  }

  print("the factorial of $facto is : $sum");

}