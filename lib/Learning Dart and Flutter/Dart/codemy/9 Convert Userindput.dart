import 'dart:io';

void main(){
  print("enter a numbejhr");g

  var nummy = stdin.readLineSync();
  var nummy2 = int.parse(nummy??'0') + 10;
  print("$nummy + 10 = $nummy2");

}