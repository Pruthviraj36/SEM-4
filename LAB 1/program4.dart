import 'dart:io';

void main(){
  int a = int.parse(stdin.readLineSync()!);
  int count=0;
  if(a<=1){
    print("not prime");}
  else{
  for(int i=2;i<a;i++){
      if(a%i==0){
        count++;
    }
  }
  if(count<2){
    print("prime");
  }
  else{
      print("not prime");
  }
}}