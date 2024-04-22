// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController entrada = TextEditingController();
  TextEditingController saida = TextEditingController();

  void calcularTemp() {
    double c, f;

    c = double.parse(entrada.text);
    f = (c * 9 / 5) + 32;

    saida.text = f.toString();
  }

  clean() {
    entrada.clear();
    saida.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.only(top: 80, left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Conversor de Temperatura",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  "Converta de Celsius para Fahrenheit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: entrada,
                    keyboardType: TextInputType.number,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Entre com uma temperatura em Celsius"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: saida,
                    keyboardType: TextInputType.number,
                    enabled: false,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: "Temperatura em Fahrenheit"),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: (double.infinity - 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white),
                      child: Text("Converter"),
                      onPressed: () {
                        calcularTemp();
                      },
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            width: 1.0, // largura da borda
                            color: Colors.white, // cor da borda
                          ),
                        ),
                        onPressed: () {
                          clean();
                        },
                        child: Text(
                          "Limpar",
                          style: TextStyle(
                            color: Colors.white, // cor do texto
                            fontSize: 16, // tamanho do texto
                          ),
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
