import 'dart:io';

void main(){
  print('phonebook dictionary');
  Map<String, String> phoneBook = {};

  print("Enter the number of records :");
  int rec = int.parse(stdin.readLineSync()!);

  for(int i = 0; i < rec; i++){
    print("Enter the name :");
    String name = stdin.readLineSync()!;


    print("Enter the phone number  :");
    String number = stdin.readLineSync()!;

    phoneBook[name] = number;
  }

  print("The entries in the Phonebook is : ");
  phoneBook.forEach((name, number){
    print("$name: $number");
  });

   print("Enter the name to search his/her number :");
   String search = stdin.readLineSync()!;

   bool entry = phoneBook.containsKey(search);
   if(entry){
     print('The number of $search is : ${phoneBook[search]} ');
   }
   else{
     print('No contact found for ${search}.');
   }


}