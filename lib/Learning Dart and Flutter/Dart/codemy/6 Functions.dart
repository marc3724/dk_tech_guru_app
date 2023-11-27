void main(){

  //normal
  myFunction(){
    print("function 0: hello");
  }
  myFunction();


  //----------------------------------------------------------------------------


  //use a return
  myFunction1(){
    return "function 1: hello";
  }
  var function = myFunction1();
  print(function);


  //----------------------------------------------------------------------------


  //return a value
  myFunction2(var firstName){
    return "function 2: hello $firstName";
  }
  var function2 = myFunction2("Marcus");
  print(function2);


  //----------------------------------------------------------------------------


  //return 2 values - notice i don't need to specify the 2nd variable type
  myFunction3(String firstName, lastName){
    return "function 3: hello $firstName and $lastName";
  }
  var function3 = myFunction3("Marcus", "Tim");
  print(function3);


  //----------------------------------------------------------------------------


  //return 2 values but one is null "optional positional parameters"
  myFunction4(var firstName, [lastName]){
    return "function 4: hello $firstName and $lastName";
  }
  var function4 = myFunction4("Marcus"); //removed Tim
  print(function4);


//----------------------------------------------------------------------------


  //return 2 values but one is null using a "named parameter"
  myFunction5(var firstName, middleName, {lastName}){
    return "function 5: hello $firstName $middleName $lastName";
  }                                     //can remove last name
  var function5 = myFunction5("Marcus",lastName:"Madsen","notnull");
  print(function5);


//----------------------------------------------------------------------------


  //return 2 values where one is null but has a default set
  myFunction6(String firstName, {name2 = "Maddeson"} ){
    return "function 6: hello Mr $firstName $name2 ";
  }                                   //name 2 can be removed
  var function6 = myFunction6("Marcus", name2: "Madsen");
  print(function6);

}