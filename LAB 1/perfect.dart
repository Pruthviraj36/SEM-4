import 'dart:io';

void main(){
  stdout.write("Enter a Number : ");
  int n = int.parse(stdin.readLineSync()!);

  int sum=0;
  for(int i=1;i<n;i++){
    int r = n % i;
    if(r==0){
      sum = sum + i;
    }
  }
  if(sum==n){
    print("Perfect Number");
  }
  else{
    print("Not Perfect Number");
  }
}