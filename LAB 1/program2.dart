import 'dart:io';
void main(){
  int noofrow = int.parse(stdin.readLineSync()!);
  for(int i=0;i<=noofrow;i++){
    for(int j=5;j>=i;j--){
      stdout.write(' ');
    }
    for(int k=0;k<=i;k++){
      stdout.write(' *');
    }
    print(' ');
  }
}