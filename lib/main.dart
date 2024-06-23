import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prova',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaSubtracao(),
    );
  }
}

class TelaSubtracao extends StatefulWidget {
  @override
  _TelaSubtracaoState createState() => _TelaSubtracaoState();
}

class _TelaSubtracaoState extends State<TelaSubtracao> {
  final TextEditingController _numero1 = TextEditingController();
  final TextEditingController _numero2 = TextEditingController();
  Color _corDeFundo = Colors.white;
  String _resultado = ''; //vazio

  void _calcularSubtracao() {
    final double num1 = double.tryParse(_numero1.text) ?? 0.0;
    final double num2 = double.tryParse(_numero2.text) ?? 0.0;
    final double resultado = num1 - num2;

    setState(() {
      if (resultado < 0) {
        _corDeFundo = Colors.red;
      } else {
        _corDeFundo = Colors.green;
      }
      _resultado = '$resultado'; //trás o resultado
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _corDeFundo,
      appBar: AppBar(
        title: Text('Subtração'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _numero1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o primeiro número',
              ),
            ),
            TextField(
              controller: _numero2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Digite o segundo número',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Subtração'),
              onPressed: _calcularSubtracao,
            ),
            SizedBox(height: 10),
            Text(
              "Resultado: " + _resultado,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), //fonte, clara escura
            ),
            SizedBox(height: 10),
            Text(
              "valor 1: " + _numero1.text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "valor 2: " + _numero2.text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
