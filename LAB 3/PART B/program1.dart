import 'dart:io';

void main(){
  print("Enter the elements space separately :");
  String str = stdin.readLineSync()!;

  List<String> str1 = str.split(" ");
  List<int> list = str1.map(int.parse).toList();


  int n = list.length;
  int uniqueElement = 0;
  for(int i = 0; i < n; i++){
    uniqueElement ^= list[i];
  }

  print("The UNIQUE element in the given array is : ${uniqueElement}");
}
