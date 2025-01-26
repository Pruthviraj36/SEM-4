
import 'dart:io';
import 'dart:math';

void main(){
  //
  // stdout.write(" Welcome to the number guessing game !!");
  // print("Guess the number between 0 to 100 ");
  // var random = Random();
  // var num = random.nextInt(101);
  //
  // print("Guess the number  :");
  // int guess = int.parse(stdin.readLineSync()!);
  //
  // var attemps = 0;
  //
  // while(guess != num){
  //   if(guess > num) {
  //
  //     print("Too high");
  //     attemps++;
  //     print("Enter little bit lower number");
  //     guess = int.parse(stdin.readLineSync()!);
  //
  //   }
  //   else if(guess < num){
  //
  //     print("Too low!");
  //     attemps++;
  //     print("Enter little bit higher number");
  //     guess = int.parse(stdin.readLineSync()!);
  //
  //   }
  //
  // }
  //
  // print(" You guess the correct number ${num} in  attemps ${attemps}");

  print(" hello,i am Odedra Viraj !");

  print("Enter the first number :");
  int? number1 = int.parse(stdin.readLineSync()!);
  print("Enter the second number :");
  int? number2 = int.parse(stdin.readLineSync()!);


  int? ans = number1 + number2;
  print("The answer is : ${ans} ");
  // stdout.write(ans);

  // fahrenheit to celsius

print("Enter the temperature in Fahrenheit !");
double? temp = double.parse(stdin.readLineSync()!);

var cel = (temp - 32)*(5/9);

print("The temperature in celsius is : ${cel}");


print("Enter the mark of subjects ");
  print("Enter the mark of subject 1");
  int? mark1 = int.parse(stdin.readLineSync()!);

  print("Enter the mark of subject 2");
  int? mark2 = int.parse(stdin.readLineSync()!);

  print("Enter the mark of subject 3");
  int? mark3 = int.parse(stdin.readLineSync()!);

  print("Enter the mark of subject 4");
  int? mark4 = int.parse(stdin.readLineSync()!);

  print("Enter the mark of subject 5");
  int? mark5 = int.parse(stdin.readLineSync()!);

  var avg = ( (mark1 + mark2 + mark3 + mark4 + mark5) / 500 ) * 100;
  print('The average of the marks is : ${avg}%');

  print("Enter the distance in the meter :");
  int? meter = int.parse(stdin.readLineSync()!);

  var feet = meter * 3.28;

  print("the feet is : ${feet}");




}
