import 'dart:io';

void main(){

  List<int> list = [];
  // print("Enter the size of the list :");
  // int? listSize = int.parse(stdin.readLineSync()!);

  print("Enter the elements to for exit : -1");
  int num = int.parse(stdin.readLineSync()!);
  while(num != -1){
    list.add(num);
    num = int.parse(stdin.readLineSync()!);
  }

}