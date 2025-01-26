import 'dart:io';

void main(){
  print('Enter the number :');
  int? num = int.parse(stdin.readLineSync()!);

  if(num >= 0){
    print("The number you entered  is positive !");
  }
  else{
    print("The number you entered is negstive !");
  }
}
