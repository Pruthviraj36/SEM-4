import 'dart:io';

class Friend {
  String name;
  int age;
  String phone;

  Friend({required this.name, required this.age, required this.phone});

  @override
  String toString() {
    return 'Name: $name, Age: $age, Phone: $phone';
  }
}

void main(){
  Map<String, Friend> friends = {
    'Manav': Friend(name: 'Manav', age: 19, phone: '1234567890'),
    'Viraj': Friend(name: 'Viraj', age: 19, phone: '9876543210'),
    'Raiya': Friend(name: 'Raiya', age: 39, phone: '1122334455'),
  };

  print("Enter a friend's name to search:");
  String name = stdin.readLineSync()!;

  if(friends.containsKey(name)){
    print('Details of the ${name} is : ${friends[name]}');
  }
  else{
    print('There is no such details of the ${name}');
  }
}