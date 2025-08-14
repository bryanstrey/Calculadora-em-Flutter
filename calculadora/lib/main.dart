import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  double _resultado = 0.0;

  void _somar() {
    setState(() {
      _resultado = double.parse(_num1Controller.text) +
          double.parse(_num2Controller.text);
    });
  }

  void _subtrair() {
    setState(() {
      _resultado = double.parse(_num1Controller.text) -
          double.parse(_num2Controller.text);
    });
  }

  void _multiplicar() {
    setState(() {
      _resultado = double.parse(_num1Controller.text) *
          double.parse(_num2Controller.text);
    });
  }

  void _dividir() {
    setState(() {
      double divisor = double.parse(_num2Controller.text);
      _resultado = divisor != 0
          ? double.parse(_num1Controller.text) / divisor
          : double.nan;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora Simples"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              decoration: const InputDecoration(labelText: "Número 1"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _num2Controller,
              decoration: const InputDecoration(labelText: "Número 2"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: _somar, child: const Text("+")),
                ElevatedButton(onPressed: _subtrair, child: const Text("-")),
                ElevatedButton(onPressed: _multiplicar, child: const Text("*")),
                ElevatedButton(onPressed: _dividir, child: const Text("/")),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "Resultado: ${_resultado.isNaN ? "Erro (divisão por zero)" : _resultado}",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}