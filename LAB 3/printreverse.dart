import 'dart:io';

void main(){
  print("Entre the Number  !!");
  String str  = (stdin.readLineSync()!);

 int temp = str.length - 1;

 while(temp >= 0){
   stdout.write(str[temp--]);
 }
}
