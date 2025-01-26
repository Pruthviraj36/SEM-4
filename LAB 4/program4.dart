import 'dart:io';
import 'dart:math';

void main(){
  print('Enter the number to check it whether it is prime or not !');
  int num = int.parse(stdin.readLineSync()!);

  bool ans = checkPrime(num);
  if(ans) print("$num is prime");
  else print("$num is Not prime");

}
bool checkPrime([int num = 1]){
  if(num == 1) print("Prime !");

  for(int i = 2; i <= sqrt(num); i++){
    if(num % i == 0){
      return false;
    }
  }
  return true;
}