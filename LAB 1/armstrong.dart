import 'dart:io';
void main(){

  stdout.write("Enter a Number : ");
  int n = int.parse(stdin.readLineSync()!);

  int sum = 0;
  int temp = n;

  while(temp!=0){
    int r = temp%10;
    sum = sum + (r*r*r);
    temp = (temp/10).floor();
  }
  if(sum==n){
    print("Armstrong Number");
  }
  else{
    print("Not Armstrong Number");
  }
}