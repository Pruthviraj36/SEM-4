import 'dart:io';

void main(){
  print('WAP to read 2 list and return list that contains only the elements that are common between them');

  List<int> first = [];
  print("Enter the elements of the first list :");
  int temp1 = int.parse(stdin.readLineSync()!);

  while(temp1 != -1){
    first.add(temp1);
    print("Enter the elements (Enter -1 to EXIT !)");
    temp1 = int.parse(stdin.readLineSync()!);
  }

  List<int> second = [];
  print("Enter the elements of the second list :");
  int temp2 = int.parse(stdin.readLineSync()!);

  while(temp2 != -1){
    second.add(temp2);
    print("Enter the elements (Enter -1 to EXIT !)");
    temp2 = int.parse(stdin.readLineSync()!);
  }

  List<int> common = first.toSet().intersection(second.toSet()).toList();

  print("The common elements are: $common");
}

