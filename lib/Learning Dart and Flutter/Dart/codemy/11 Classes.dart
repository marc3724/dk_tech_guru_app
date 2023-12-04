void main (){
  Person p1 = Person("Tim", "male", 37);
  p1.showData();

  Person p2 = Person.withmoney("Mary", "female", 26,2500);
  p2.showData();
}

class Person {
  String? name, sex;
  int? age, money;

  //constructor
  Person.withmoney(this.name, this.sex, this.age, this.money);

  Person(String this.name, String this.sex, int this.age);

  void showData(){
    print("name = $name");
    print("sex = $sex");
    print("age = $age");
    print("this person's name is $name they are $sex and $age old");
  }



}