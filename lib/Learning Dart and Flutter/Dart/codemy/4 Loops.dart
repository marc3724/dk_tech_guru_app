void main() {

  //for loop
  int num = 5;
  // https://www.w3schools.com/java/java_for_loop.asp
  for (int i = num; i >= 1; i--){
    print(i);
  }



  //for in loop - a for each loop
  var names = ["Tim", "Marcus", "James"];
  for (var name in names) {
    print(name);
  }


  //while loop

  while (num >= 1){
    print(num);
    num--;
  }
}