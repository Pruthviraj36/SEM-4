import 'dart:io';
void main(){
  stdout.write("subject 1 : ");
  int s1 = int.parse(stdin.readLineSync()!);

  stdout.write("subject 2 : ");
  int s2 = int.parse(stdin.readLineSync()!);

  stdout.write("subject 3 : ");
  int s3 = int.parse(stdin.readLineSync()!);

  stdout.write("subject 4 : ");
  int s4 = int.parse(stdin.readLineSync()!);

  stdout.write("subject 5 : ");
  int s5 = int.parse(stdin.readLineSync()!);

  double per = (s1+s2+s3+s4+s5)/500*100;
  print("percentage : $per%");

  if(per < 35){
    print("You are failed !!");
  }
  else if(per > 35 && per < 45){
    print("Pass");
  }
  else if(per > 45 && per < 60){
    print("Second Class");
  }
  else if(per > 60 && per < 70){
    print("First class");
  }
  else{
    print("Distinction");
  }
}