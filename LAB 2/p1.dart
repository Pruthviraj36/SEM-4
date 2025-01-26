import 'dart:io';
void main(){
  stdout.write("Enter a Number : ");
  int n = int.parse(stdin.readLineSync()!);

  if(n > 0){
    print("possitive Number");
  }
  else{
    print("negative Number");
  }
}