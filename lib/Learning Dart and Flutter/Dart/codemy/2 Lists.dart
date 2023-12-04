void main() {

  // Lists
  var myList = [0, 1, 2];
  print(myList[0]);
  print("this is the item on place 0 in my list " + myList[1].toString());


  //change an item
  myList[0] = 41;
  print(myList);


  //creating an empty list
  var emptyList = [];
  print(emptyList);

  //add
  emptyList.add(1);
  print(emptyList);

  //addAll
  emptyList.addAll([41, 2, 3]);
  print(emptyList);


  //insert
  myList.insert(3, 900);
  print(myList);

  //insert many
  myList.insertAll(4, [1, 3, 99, 100]);
  print(myList);



  //mixed list
  var mixedList = [1,2,2,3,"Marcus", "Tim", "Tim"];
  print(mixedList);



  //remove from list
  mixedList.remove("Tim");

  //remove specific item
  mixedList.removeAt(2);

}