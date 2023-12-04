void main() {
  //greetings();
  //listTest();

  User user1 = User('Tim', 33);
  user1.login();

  SuperUser userThree = SuperUser('yoshi', 20);
  userThree.publish();

}
//can use arrow functions if you return on one line


void greetings(){
  String greet = greeting();
  int num = calculateAge(1999,24);

  print(greet);
  print(num);
}
String greeting () => "hello";
int calculateAge(int num1, int num2){
  return num1+num2;
}

void listTest(){
  List namesAndNumbers = ['chin-li', 'yoshi', 'mario'];
  namesAndNumbers.add('Wario');
  namesAndNumbers.remove(1);
  namesAndNumbers.add(30);

  List<int> numbersOnly = [1,2,3,4];
  numbersOnly.add(5);

  print(namesAndNumbers);
  print(numbersOnly);
}


//class again
class User {
  String username;
  int age;

  String test(String gimme){
    return gimme+gimme;
  }

  User(this.username,this.age);

  void login() {
    print("user aka. $username logged in");
  }
}

class SuperUser extends User{
  SuperUser (String username, int age) : super(username, age);

  void publish(){
    print("$username published update");
  }
}