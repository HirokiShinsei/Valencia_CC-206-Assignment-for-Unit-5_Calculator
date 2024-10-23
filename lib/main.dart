import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the sum section
  int sum = 0;
  int difference = 0;
  int product = 0;
  double quotient = 0;

  // either use a TextEditingController for each input field to get the value
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();

  // or store each value in the state
  // int firstAddNum = 0;

  int parseinput(String value) {
    return int.tryParse(value) ?? 0;
  }

  void add(){
    int firstAddNum = parseinput(add1Controller.text);
    int secondAddNum = parseinput(add2Controller.text);
    setState(() {
      sum = firstAddNum + secondAddNum;
    });
  }

  void subtract(){
    int firstAddNum = parseinput(add1Controller.text);
    int secondAddNum = parseinput(add2Controller.text);
    setState(() {
      difference = firstAddNum - secondAddNum;
    });
  }

  void multiply(){
    int firstAddNum = parseinput(add1Controller.text);
    int secondAddNum = parseinput(add2Controller.text);
    setState(() {
      product = firstAddNum * secondAddNum;
    });
  }

  void divide(){
    int firstAddNum = parseinput(add1Controller.text);
    int secondAddNum = parseinput(add2Controller.text);
    setState(() {
      quotient = firstAddNum / secondAddNum;
    });
  }

  void clear(){
    setState(() {
      sum = 0;
      difference = 0;
      product = 0;
      quotient = 0.0;
      add1Controller.clear();
      add2Controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Add Row (Addition)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: add1Controller,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Text(" + "),
                Expanded(
                  child: TextField(
                    controller: add2Controller,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.calculate),
                  onPressed: add,
                ),
                Text(' = $sum'),
              ],
            ),

            // Clear button
            ElevatedButton(
              onPressed: clear,
              child: const Text("Clear"),
            ),

            // Subtract Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: add1Controller,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Text(" - "),
                Expanded(
                  child: TextField(
                    controller: add2Controller,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: subtract,
                ),
                Text(' = $difference'),
              ],
            ),

            // Multiply Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: add1Controller,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Text(" * "),
                Expanded(
                  child: TextField(
                    controller: add2Controller,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: multiply,
                ),
                Text(' = $product'),
              ],
            ),

            // Divide Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: add1Controller,
                    decoration: const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const Text(" / "),
                Expanded(
                  child: TextField(
                    controller: add2Controller,
                    decoration: const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: const Icon(Icons.horizontal_rule),
                  onPressed: divide,
                ),
                Text(' = $quotient'),
              ],
            ),
        ],
      ),
    );
  }
}
