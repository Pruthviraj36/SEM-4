import 'dart:io';

void main(){
  print("Enter the number of the Terms :");
  int a = int.parse(stdin.readLineSync()!);

  fibbo(a);
}

void fibbo([int a = 0,]){
  int first = 0;
  int second  = 1;
  stdout.write(first);
  stdout.write(second);
  for(int i = 1; i <= a - 2; i++){
    int third  = first + second;
    stdout.write(third);
    first = second;
    second = third;
  }
}