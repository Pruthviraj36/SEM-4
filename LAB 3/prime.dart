import 'dart:io';

void main(){
  print("Enter the number to check whether it is prime or not !!");
  int? num  = int.parse(stdin.readLineSync()!);
  int flag = 0;

  for(int i = 2;i < num/2; i++){

    if(num % i==0){

      flag=1;
      break;
    }
  }
  if(flag==1){
    stdout.write("The number is not prime.");
  }

  else{
    stdout.write("The number is prime.");
  }

}
