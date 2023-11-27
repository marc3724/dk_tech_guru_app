void main (){
  Person p1 = Person("Tim", "male", 37);
  p1.showData();

  Person p2 = Person("Mary", "female", 26);
  p2.showData();
}

class Person {
  String? name, sex;
  int? age;


  //constructor
  Person(this.name, this.sex, this.age);

  void showData(){
    print("name = $name");
    print("sex = $sex");
    print("age = $age");
    print("this person's name is $name they are $sex and $age old");
  }



}