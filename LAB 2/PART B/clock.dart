import 'dart:io';

void main(){
  print("Enter the hour :");
  int hour = int.parse(stdin.readLineSync()!);

  print('Enter the minutes :');
  int min = int.parse(stdin.readLineSync()!);

  double angle = calculateAngle(hour, min);
  print("The angle between the hour and minute hands is: ${angle}% degrees");
}

double calculateAngle(int hour, int min){

  hour = hour % 12;
  double hourAngle = (hour * 30) + (min * 0.5);

  double minAngle = min * 6;

  double hourMinDiff = (hourAngle - minAngle).abs();

  return hourMinDiff < 180 ? hourMinDiff : 360 - hourMinDiff;
}
