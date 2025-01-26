import 'dart:io';

void main(){
  print("Enter the operation you want to perform !");
  String op = stdin.readLineSync()!;

  print("Enter the first number :");
  double num1 = double.parse(stdin.readLineSync()!);

  print("Enter the first number :");
  double num2 = double.parse(stdin.readLineSync()!);

  switch(op){
    case '+' :
      double operation = num1 + num2;
      print("The addition of both numbers are : $operation");
      break;

    case '-' :
      double operation = num1 - num2;
      print("The substraction of both numbers are : $operation");
      break;

    case '*' :
      double operation = num1 * num2;
      print("The multiplication of both numbers are : $operation");
      break;

    case '/' :
      double operation = num1 / num2;
      print("The division of both numbers are : $operation");
      break;
  }

  if(op == '+'){
    double operation = num1 + num2;
    print("The addition of both numbers are : $operation");
  }
  else if(op == '-'){
    double operation = num1 - num2;
    print("The substraction of both numbers are : $operation");
  }
  else if(op == '*'){
    double operation = num1 * num2;
    print("The multiplication of both numbers are : $operation");
  }
  else{
    double operation = num1 / num2;
    print("The division of both numbers are : $operation");
  }
}
