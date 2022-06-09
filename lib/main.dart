import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter",
      home: textFildScreen(),
    );
  }
}

class textFildScreen extends StatefulWidget {
  textFildScreen({Key? key}) : super(key: key);

  @override
  State<textFildScreen> createState() => _textFildScreen();
}

class _textFildScreen extends State<textFildScreen> {
  final _controllerA = TextEditingController();
  final _controllerB = TextEditingController();
  String a = "";
  String b = "";
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Text("Відповідь: $name"),
          inputAWidget(controllerA: _controllerA),
          inputBWidget(controllerB: _controllerB),
          Container(
            width: double.infinity,
            child: TextButton(
              child: Text("розрахувати"),
              onPressed: () {
                setState(
                  () {
                    a = _controllerA.text;
                    b = _controllerB.text;
                    name = a + b;
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class inputBWidget extends StatelessWidget {
  const inputBWidget({
    Key? key,
    required TextEditingController controllerB,
  })  : _controllerB = controllerB,
        super(key: key);

  final TextEditingController _controllerB;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: TextField(
          controller: _controllerB,
          decoration: InputDecoration(hintText: "введіть значення b"),
        ),
      ),
    );
  }
}

class inputAWidget extends StatelessWidget {
  const inputAWidget({
    Key? key,
    required TextEditingController controllerA,
  })  : _controllerA = controllerA,
        super(key: key);

  final TextEditingController _controllerA;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        child: TextField(
          controller: _controllerA,
          decoration: InputDecoration(hintText: "введіть значення a"),
        ),
      ),
    );
  }
}
