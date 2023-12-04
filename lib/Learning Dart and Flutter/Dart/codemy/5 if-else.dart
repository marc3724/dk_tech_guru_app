void main() {
  var num = -1;
  print("num is = $num");

  var x = 1;
  num = x;
  print(num);


  if ( num == 5 ) {
    print("congrats the number is $num");
  }

  else if (0 > num){
    print("the number is invalid please roll again");
  }

  else {
    print("sadly the number is $num");
  }
}