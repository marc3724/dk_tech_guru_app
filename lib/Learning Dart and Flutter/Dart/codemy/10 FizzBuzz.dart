void main () {
//make a fizzbuzz program

for (int i = 1; i <= 100; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
      print('FizzBuzz');
    } else if (i % 3 == 0) {
      print('Fizz');
    } else if (i % 5 == 0) {
      print('Buzz');
    } else {
      print(i);
    }
  }

/*
make it count from 1 - 100
on numbers such as 3, 6, 9 it should spell out fizz
and numbers divisably by 5 i should spell out buzz
and if it is divisably by both 3 and 5 it should spell fizzbuzz
see discord for example
*/
}