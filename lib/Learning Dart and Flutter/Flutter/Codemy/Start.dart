import 'package:flutter/material.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("hello world from appbar!"),
          ),
          backgroundColor: Colors.deepPurple[400],
        ),
        body: Container(
          color: Colors.cyan,
          width: 150,
          height: 150,
          child: Text("hello"),
        ),
      ),
    );
    //return const Placeholder();
  }
}/*//https://www.appicon.co/
Center(
          //child: Image(image: NetworkImage('https://gamersupps.gg/cdn/shop/files/benefits-icons_25ffb80f-2088-4798-8767-380120a8b7fb.png')),
          child: Image(
              image: AssetImage('images/Trigster.png')
          ),
        ),
        backgroundColor: Colors.deepPurple[200],
*/

