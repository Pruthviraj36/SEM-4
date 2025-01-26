import 'dart:io';

void main(){
  print("Enter the first number :");
  int a = int.parse(stdin.readLineSync()!);
  print("Enter the first number :");
  int b = int.parse(stdin.readLineSync()!);

  int ans = getMax(a, b);
  // int ans = getMax();
  print("THe maximum number is : $ans");

}

int getMax([int a = 0, int b = 4]){
  return a > b ? a : b;
}