import 'dart:io';
void main(){
  print('Enter the elements of the array with space seperate !');
  String? input = stdin.readLineSync();
  List<int> intList = [];

  if (input != null && input.isNotEmpty) {
      List<String> stringList = input.split(' ');
      intList = stringList.map(int.parse).toList();
  }else{
    print("No input provided.");
  }

  int sum = maxSum(intList);
  print("The largest sum from a given integer array is ${sum}");
}

int maxSum(List<int> intList){
  int max = intList[0];
  int currSum = intList[0];
  int n = intList.length;


  for(int i = 1; i < n; i++ ){
    currSum = intList[i] > (currSum + intList[i]) ? intList[i] : (currSum + intList[i]);

    max = max > currSum ? max : currSum;
  }
  return max;
}
