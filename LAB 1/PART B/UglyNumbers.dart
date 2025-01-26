import 'dart:io';

void main() {
  print("Enter the number to check whether it is ugly or not:");
  int num = int.parse(stdin.readLineSync()!);

  bool result = checkUgly(num);

  if (result) {
    print("The number ${num} is an Ugly Number.");
  } else {
    print("The number ${num} is NOT an Ugly Number.");
  }
}

bool checkUgly(int num) {
  if (num <= 0) return false; // Ugly numbers are positive

  while (num % 2 == 0) {
    num ~/= 2; // Integer division
  }
  while (num % 3 == 0) {
    num ~/= 3;
  }
  while (num % 5 == 0) {
    num ~/= 5;
  }
  return num == 1;
}
