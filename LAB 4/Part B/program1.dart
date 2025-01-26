import 'dart:io';

void main() {
  print("Enter the number of names :");
  int size = int.parse(stdin.readLineSync()!);

  List<String> names = [];
  List<int> heights = [];

  for (int i = 0; i < size; i++) {
    print("Enter the name :");
    String name = stdin.readLineSync()!;
    names.add(name);

    print("Enter the height in cm :");
    int height = int.parse(stdin.readLineSync()!);
    heights.add(height);
  }

  List<Map<String, dynamic>> map = [];
  for (int i = 0; i < size; i++) {
    map.add({"name": names[i], "height": heights[i]});
  }

  map.sort((aHeight, bHeight) => bHeight['height'].compareTo(aHeight['height']));

  print("\nSorted names based on heights:");
  for (var entry in map) {
    print(entry["name"]);
  }
}
