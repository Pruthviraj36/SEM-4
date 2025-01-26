import 'dart:io';

void main(){
  int a=0;
  int b=1;
  int sum=0;

  stdout.write('0  ');
  for(int i=0;i<15;i++){
    a=b;
    b=sum;
    sum = a+b;
    stdout.write("$sum  ");
  }
}


