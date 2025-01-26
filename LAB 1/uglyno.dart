import 'dart:io';

void main(){
  stdout.write("Enter a Number : ");
  double n = double.parse(stdin.readLineSync()!);

  int x = 0;
  while(n!=1){
    if(n%5==0){
      n/=5;
    }
    else if(n%3==0){
      n/=3;
    }
    else if(n%2==0){
      n/=2;
    }
    else{
      print("Not ugly number");
      x=1;
      break;
    }
  }
  if(x==0){
    print("ugly number");
  }
}