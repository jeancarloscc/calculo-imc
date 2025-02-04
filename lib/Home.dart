import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _peso = TextEditingController();
  TextEditingController _altura = TextEditingController();

  String exibirResultado = "";
  String resultadoIMC = "";
  String pesoIdeal = "";

  int _opcaoEscolhida = 0;

  void _calcular() {
    double? peso = double.tryParse(_peso.text);
    double? altura = double.tryParse(_altura.text);

    if (peso == null || altura == null || altura == 0) {
      // Trate o caso em que peso ou altura são nulos ou altura é zero
      setState(() {
        exibirResultado = "Por favor, insira valores válidos para peso e altura.";
      });
      return;
    }

    double resultado = peso / pow(altura, 2);
    _tabelaIMC(resultado);

    altura = altura * 100;

    if (_opcaoEscolhida == 0) {
      double result = (altura - 100) * 0.90;
      pesoIdeal = "Seu Peso Ideal: " + result.toStringAsFixed(2) + " Kg";
    } else {
      double result = (altura - 100) * 0.85;
      pesoIdeal = "Seu Peso Ideal: " + result.toStringAsFixed(2) + " Kg";
    }

    setState(() {
      exibirResultado = resultado.toStringAsPrecision(3) + " kg/m²";
    });
  }

  String _tabelaIMC(double resultado) {
    if (resultado < 16) {
      resultadoIMC = "Baixo peso muito grave";
    } else if (resultado >= 16 && resultado < 16.99) {
      resultadoIMC = "Baixo peso grave";
    } else if (resultado >= 17 && resultado < 18.49) {
      resultadoIMC = "Baixo Peso";
    } else if (resultado >= 18.50 && resultado < 24.99) {
      resultadoIMC = "Peso normal";
    } else if (resultado >= 25 && resultado < 29.99) {
      resultadoIMC = "Sobrepeso";
    } else if (resultado >= 30 && resultado < 34.99) {
      resultadoIMC = "Obesidade grau 1";
    } else if (resultado >= 35 && resultado < 39.99) {
      resultadoIMC = "Obesidade grau 2";
    } else {
      resultadoIMC = "Obesidade grau 3 (obesidade mórbida)";
    }
    return resultadoIMC;
  }

  void _resetFields() {
    _altura.text = "";
    _peso.text = "";
    setState(() {
      _formKey = GlobalKey<FormState>();
      exibirResultado = "";
      resultadoIMC = "";
      pesoIdeal = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calcular o IMC"),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(),
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Seu Índice de Massa Corporal é:",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Divider(),
                Text(
                  exibirResultado,
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Text(
                  resultadoIMC + " / " + pesoIdeal,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                Divider(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _altura,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Preencha o campo";
                          } else if (value.contains(",")) {
                            return "Coloque o '.' no valor";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Ex:. 1.70",
                            filled: true,
                            labelText: "Altura (m)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                      Divider(),
                      TextFormField(
                        controller: _peso,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Preencha o campo";
                          } else if (value.contains(",")) {
                            return "Coloque o '.' no valor";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: "Ex:. 75.2",
                            filled: true,
                            labelText: "Peso (kg)",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Radio(
                        value: 0,
                        groupValue: _opcaoEscolhida,
                        onChanged: (int? value) {
                          setState(() {
                            _opcaoEscolhida = value!;
                          });
                        }),
                    Text(
                      "Masculino",
                      style: TextStyle(fontSize: 20),
                    ),
                    Radio(
                        value: 1,
                        groupValue: _opcaoEscolhida,
                        onChanged: (int? value) {
                          setState(() {
                            _opcaoEscolhida = value!;
                          });
                        }),
                    Text(
                      "Feminino",
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _calcular();
                      }
                    },
                    child: Text(
                      "Calcular",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
