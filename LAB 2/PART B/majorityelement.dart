import 'dart:io';
void main(){
  print("Enter the length of he array :");
  int size  = int.parse(stdin.readLineSync()!);

  List<int> list = [];
  for(int i = 0; i < size; i++){
    print("Enter the ${i + 1} element :");
    int num = int.parse(stdin.readLineSync()!);
    list.add(num);
  }
  int major = majorElement(list);
  print("The major elements in given Array is : ${major}");

}

int majorElement(List<int> list){
  int count = 0;
  int? first;

  for(int number in list){
    if(count == 0){
      first = number;
    }
    if(number == first){
      count += 1;
    }
  }
  return first!;
}

