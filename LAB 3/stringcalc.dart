import 'dart:io';

void main(){

  print("Enter the operation string");
  String str = stdin.readLineSync()!;

  // final stack = Stack<String>();
  for(int i = 0; i < str.length; i++){
    if(str[i] == '+' || str[i] == '-' || str[i] == '*' || str[i] == '/'){

    }
  }
}
// class Stack<E> {
//   final _list = <E>[];
//
//   void push(E value) => _list.add(value);
//
//   E pop() => _list.removeLast();
//
//   E get peek => _list.last;
//
//   bool get isEmpty => _list.isEmpty;
//   bool get isNotEmpty => _list.isNotEmpty;
//
//   @override
//   String toString() => _list.toString();
// }
