import 'dart:io';

void main(){
  print("Enter the string :");
  String str = stdin.readLineSync()!;

  List<String> word = [];
  word = str.trim().split(" ");

  int n = word.length;
  int size = word[n - 1].length;

  print('The length of the last word is : $size');
}
