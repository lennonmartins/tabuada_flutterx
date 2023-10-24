import 'package:flutter/material.dart';
import 'package:tabuada/logica_tabuda.dart';

class TabuadaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
      ),
      home: TabuadaScreen(),
    );
  }
}

class TabuadaScreen extends StatefulWidget {
  @override
  _TabuadaScreenState createState() => _TabuadaScreenState();
}

class _TabuadaScreenState extends State<TabuadaScreen> {
  TextEditingController _numeroController = TextEditingController();
  List<String> resultados = [];

  CalculadoraTabuada calculadoraTabuada = CalculadoraTabuada();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tabuada App'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Informe um número',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int numero = int.tryParse(_numeroController.text) ?? 0;
                setState(() {
                  resultados = calculadoraTabuada.calcularTabuada(numero);
                });
              },
              child: Text('Calcular Tabuada'),
            ),
            SizedBox(height: 20),
            if (resultados.isNotEmpty)
              Column(
                children: resultados.map((result) => Text(result)).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
