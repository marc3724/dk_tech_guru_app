void main (){
  Person p1 = Person();
  p1.addData("Jeppe", "male", 99);
  p1.addData("marcus", "female", 22);
  p1.showData();

  //Person p2 = Person("Mary", "female", 26);
  //p2.showData();
}

class Person {
  String? name, sex;
  int? age;


  //method
  void addData (String name, sex, int age ){
    this.name = name;
    this.sex = sex;
    this.age = age;
  }

  void showData(){
    print("name = $name");
    print("sex = $sex");
    print("age = $age");
    print("this person's name is $name they are $sex and $age old");
  }



}