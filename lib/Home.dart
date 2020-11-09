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

  int _opcaoEscolhida;

  _calcular() {
    double peso = double.tryParse(_peso.text);
    double altura = double.tryParse(_altura.text);
    double resultado = peso / pow(altura, 2);
    _tabelaIMC(resultado);
    altura = altura * 100;

    if(_opcaoEscolhida == 0){
      double result = (altura - 100) * 0.90;
      pesoIdeal = "Seu Peso Ideal: " + result.toString() + " Kg";
    } else {
      double result = (altura - 100) * 0.85;
      pesoIdeal = "Seu Peso Ideal: " + result.toString() + " Kg";
    }

    setState(() {
      exibirResultado = resultado.toStringAsPrecision(3) + " kg/m²";
    });
  }

  String _tabelaIMC(double resultado) {
    if (resultado < 16) {
      resultadoIMC = "Baixo peso muito grave";
    } else if (resultado > 16 && resultado < 16.99) {
      resultadoIMC = "Baixo peso grave";
    } else if (resultado > 17 && resultado < 18.49) {
      resultadoIMC = "Baixo Peso";
    } else if (resultado > 18.50 && resultado < 24.99) {
      resultadoIMC = "Peso normal";
    } else if (resultado > 25 && resultado < 29.99) {
      resultadoIMC = "Sobrepeso";
    } else if (resultado > 30 && resultado < 34.99) {
      resultadoIMC = "Obesidade grau 1";
    } else if (resultado > 35 && resultado < 39.99) {
      resultadoIMC = "Obesidade grau 2";
    } else {
      resultadoIMC = "Obesidade grau 3 (obesidade mórbida)";
    }
    return resultadoIMC;
  }

  void _resetFields() {
    _altura.text="";
    _peso.text="";
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
        title: Text("Cálcular o IMC"),
        backgroundColor: Color(0xff05F2DB),
        actions: [
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields,)
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            color: Color(0xff308C83),
          ),
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
                      "Seu Indice de Massa Corporal é:",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  Divider(),
                  Text(exibirResultado, style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center,),
                  Text(resultadoIMC + " / " + pesoIdeal, style: TextStyle(color : Colors.white, fontSize: 18), textAlign: TextAlign.center,),
                  Divider(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: _altura,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Preencha o campo";
                            } else if(value.contains(",")) {
                              return "Coloque o '.' no valor";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Ex:. 1.70",
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Altura (m)",
                              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                        Divider(color: Colors.transparent,),
                        TextFormField(
                          controller: _peso,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value.isEmpty) {
                              return "Preencha o campo";
                            } else if(value.contains(",")) {
                              return "Coloque o '.' no valor";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: "Ex:. 75.2",
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Peso (kg)",
                              labelStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: Colors.transparent,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Radio(
                          activeColor: Color(0xff0D0D0D),
                          value: 0,
                          groupValue: _opcaoEscolhida,
                          onChanged: (int value){
                            setState(() {
                              _opcaoEscolhida = value;
                            });
                          }
                      ),
                      Text("Masculino", style: TextStyle(fontSize: 20),),
                      Radio(
                          activeColor: Color(0xff0D0D0D),
                          value: 1,
                          groupValue: _opcaoEscolhida,
                          onChanged: (int value){
                            setState(() {
                              _opcaoEscolhida = value;
                            });
                          }
                      ),
                      Text("Feminino", style: TextStyle(fontSize: 20),),
                    ],
                  ),
                  Divider(color: Colors.transparent,),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    child: RaisedButton(
                      onPressed: () {
                        if(_formKey.currentState.validate()) {
                          _calcular();
                        }
                      },
                      child: Text("Calcular", style: TextStyle(fontSize: 20),),
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            )
          )),
    );
  }
}