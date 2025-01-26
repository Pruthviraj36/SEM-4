import 'dart:io';
void main(){
  print("Enter the numbers and 0 to quite");
  int num = int.parse(stdin.readLineSync()!);
  int posSum = 0;
  int negSum = 0;

  while(num != 0){
    if(num % 2 == 0 && num > 0) posSum += num;
    else if(num % 3 == 0 && num < 0) negSum -= num;

    print("Enter the numbers and 0 to quite");
     num = int.parse(stdin.readLineSync()!);
  }

  print("the sum of positive integers is : $posSum");
  print("The sum of negative integrs is : -$negSum");
}
