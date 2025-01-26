import 'dart:io';

void main(){
  print("Enter the length of the list :");
  int len = int.parse(stdin.readLineSync()!);

  List<int> list = [];

  for(int i = 0; i < len; i++){
    print("Enter the ${(i + 1)}Th number : ");
    int temp = int.parse(stdin.readLineSync()!);
    list.add(temp);
  }
  list.sort();
  print("The elements in the list are ${list} ");
}