import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String cpf = '';
    String datanasc = '';
    //
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Rafael Guimarães')),
        ),
        body: Padding(
          padding: const EdgeInsets.all(90.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Insira seus dados",
                style: TextStyle(fontSize: 20),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Insira seu CPF",
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                //onChanged, quando sofrer qq alteração vai interagir com esse elemento
                onChanged: (text) {
                  if (text.contains(".") || text.contains("-")) {
                    print('Digite o CPF sem pontos e traços');
                  }
                  cpf = text;
                  //print('CPF $text');
                },
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Insira sua data de nascimento",
                  labelStyle: TextStyle(color: Colors.grey),
                ),
                onChanged: (text) {
                  datanasc = text;
                  //print('dataNascimento $text');
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "KEY GERADA",
                  suffixIcon: Icon(Icons.copy),
                  labelStyle: TextStyle(color: Colors.grey),
                ),
              ),
              ElevatedButton(
                  onPressed: (/*func de gerar key*/) {
                    print('CPF $cpf');
                    print('Data Nasc $datanasc');
                  },
                  child: Text('GERAR KEY'))
            ],
          ),
        ),
      ),
    );
  }
}
