import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _numberFirstContrller = TextEditingController();
  final TextEditingController _numberSecondContrller = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  double _result = 0;

  double add(double numberOne, double numberTwo) {
    return numberOne + numberTwo;
  }

  double sub(double numberOne, double numberTwo) {
    return numberOne - numberTwo;
  }

  double div(double numberOne, double numberTwo) {
    return numberOne / numberTwo;
  }

  double mult(double numberOne, double numberTwo) {
    return numberOne * numberTwo;
  }

  void clear() {
    _numberFirstContrller.clear();
    _numberSecondContrller.clear();
    _result = 0;
    setState(() {});
  }

  @override
  void dispose() {
    _numberFirstContrller.dispose();
    _numberSecondContrller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double numberOne = double.tryParse(_numberFirstContrller.text.trim()) ?? 0;
    double numberTwo = double.tryParse(_numberSecondContrller.text.trim()) ?? 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Sum App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _globalKey,
          child: Column(
            children: [
              TextFormField(
                controller: _numberFirstContrller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter First Number",
                ),
                validator: (String? value) {
                  String v = value ?? '';
                  if (v.isEmpty) {
                    return "Enter Your Valid Number";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _numberSecondContrller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Second Number",
                ),
                validator: (String? value) {
                  String v = value ?? '';
                  if (v.isEmpty) {
                    return "Enter Your Valid Number";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_globalKey.currentState!.validate()) {
                          double result = add(numberOne, numberTwo);
                          _result = result;
                          setState(() {});
                        }
                      },
                      child: Text("+"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("-"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("/"),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("*"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        clear();
                        setState(() {});
                      },
                      child: Text("Clear"),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text("Result: $_result")
            ],
          ),
        ),
      ),
    );
  }
}
