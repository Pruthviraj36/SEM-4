void main(){
  List<String> str = ['Delhi', 'Mumbai', 'Bangalore'];
  str.add('Hyderabad');
  str.add('Ahmedabad');

str = str.map((word) => word.replaceAll('Ahmedabad', 'Surat')).toList();

// or using loop
  for (int i = 0; i < str.length; i++) {
    if (str[i] == 'Ahmedabad') {
      str[i] = 'Surat';
    }
  }

}