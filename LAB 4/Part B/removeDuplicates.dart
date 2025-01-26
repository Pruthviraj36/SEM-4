import 'dart:io';

void main(){
  print("Enter the size of the list :");
  int size = int.parse(stdin.readLineSync()!);

  List<int> arr = [];
  for(int i = 0; i < size ; i++){
    print('Enter the ${i + 1} element :');
    int num = int.parse(stdin.readLineSync()!);
    arr.add(num);
  }

  List<int> unique = [];
  for(int i = 0; i < size; i++){
    bool isDup = false;

    for(int j = 0; j < unique.length; j++){
      if (arr[i] == unique[j]) {
        isDup = true;
        break;
      }
    }

    if(!(isDup)){
      unique.add(arr[i]);
    }
  }
  print("\nList after removing duplicates:");
  print(unique);
}
