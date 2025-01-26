import 'dart:io';

void main(){
  print("Enter the Sentence :");
  String str = stdin.readLineSync()!;

  Map<String,int> occur= {};
  List<String> list = str.split(" ");

  for(String word in list){
    if(occur.containsKey(word)){
      occur[word] = occur[word]! + 1;
    }
    else{
      occur[word] = 1;
    }
  }
  print("The Word occurrences in given Sentence are : $occur");
}