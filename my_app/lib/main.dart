import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ByteBankApp(FormularioTransferencia()));
}

class ByteBankApp extends StatelessWidget {
  final StatelessWidget tela;

  ByteBankApp(this.tela);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: this.tela),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando Transferência')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoNumeroConta,
              style: TextStyle(
                fontSize: 18.0,
              ),
              decoration: InputDecoration(
                  labelText: "Número da Conta", hintText: "00000000"),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: TextStyle(
                fontSize: 24.0,
              ),
              decoration: InputDecoration(
                  icon: Icon(
                    Icons.monetization_on,
                    color: Colors.green,
                  ),
                  labelText: "Valor",
                  hintText: "0,00"),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final int? numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double? valor =
                  double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null) {
                final Transferencia transferenciaCriada =
                    Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
            child: Text(
              "Confirmar",
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class ListaTranferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transferências')),
      body: Column(
        children: [
          ItemTransferencias(Transferencia(100.0, 213634)),
          ItemTransferencias(Transferencia(200.0, 313635)),
          ItemTransferencias(Transferencia(300.0, 413636)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}

class ItemTransferencias extends StatelessWidget {
  final Transferencia _transferencia;

  ItemTransferencias(this._transferencia); //Constructor

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Valor: $valor, NumeroConta: $numeroConta}';
  } //Constructor
}
