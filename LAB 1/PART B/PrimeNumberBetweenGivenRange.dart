import 'dart:io';
import 'dart:math';

void main(){
  print('First give the starting point of the range:');
  int start = int.parse(stdin.readLineSync()!);
  print('Now give the ending point of the range:');
  int end = int.parse(stdin.readLineSync()!);

  List<int> res = returnPrime(start, end);
  print('Prime numbers in the range $start to $end are: $res');
}

List<int> returnPrime(int start, int end){
  List<int> primes = [];

  for(int i = start; i <= end; i++){
    if(isPrime(i)){
      primes.add(i);
    }
  }
  return primes;
}

bool isPrime(int num){
  if(num <= 1) return false;
  for(int i = 2; i <= sqrt(num); i++){
    if(num % i == 0) return false;
  }
  return true;
}
