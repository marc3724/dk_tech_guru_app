void main (){
  // maps!  KEY : values - pairs
  //                     key1       value1       key2       value2
  var favoritePizza = {"Marcus" : "Pineapple", "Shankar" : "Cheese"};
  print(favoritePizza);
  print(favoritePizza["Marcus"]);


// show values
  print(favoritePizza.values);


// show Keys
  print(favoritePizza.keys);


// show length
  print(favoritePizza.length);


//add something
  favoritePizza["Tim"] = "Sausage";
  print(favoritePizza);

//add many things
  favoritePizza.addAll({"Tina" : "Bacon", "Steve" : "Salad"});
  print(favoritePizza);

//remove something
  favoritePizza.remove("Steve");
  print(favoritePizza);

//remove everything
  favoritePizza.clear();
  print(favoritePizza);
}