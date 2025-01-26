import 'dart:io';

void main(){
  print('Enter the size of the array :');
  int size = int.parse(stdin.readLineSync()!);

  List<int> list = [];
  for(int i = 0; i < size; i++){
    print('Enter the ${(i + 1)}Th element');
    list.add(int.parse(stdin.readLineSync()!));
  }
  int sum = 0;
  for(int i = 0; i < size; i++){
    int temp = list[i];
    if(temp % 3 == 0 || temp % 5 == 0){
      sum += temp;
    }
  }
  print('the sum of all the numbers which are divisible by either 3 or 5 is : $sum');
}