import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() async {
  runApp(const ChuvaDart());
}

class ChuvaDart extends StatelessWidget {
  const ChuvaDart({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 66, 80, 208)),
        useMaterial3: true,
      ),
      home: const Agenda(),
    );
  }
}

class Agenda extends StatefulWidget {
  const Agenda({super.key});

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  int selectedDay = 26; // Inicialmente nenhum dia selecionado

  List atividades = [
    ['atividade do dia 26', 'dsads', 'eawdsdasd'],
    ['atividade do dia 27'],
    ['atividade do dia 28'],
    ['atividade do dia 29'],
    ['atividade do dia 30']
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 77, 105, 143),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            // Implemente aqui a ação ao pressionar o botão de voltar
          },
        ),
        title: const Column(
          children: [
            Text(
              'Chuva 💜 Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Programação',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(200, 255, 255, 255)),
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: IntrinsicHeight(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 77, 105, 143),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 55, 123, 213),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: const Icon(
                        Icons.calendar_today,
                        color: Color.fromARGB(255, 11, 11, 11),
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    const Expanded(
                      child: Text(
                        'Exibindo todas as atividades',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: const Color.fromARGB(
                  255, 58, 117, 220), // Cor de fundo da linha
              child: Row(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.all(2.0),
                      color: Colors.white, // Cor de fundo do texto "NOV"
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'NOV',
                            style: TextStyle(
                              color: Colors.black, // Alterando para preto
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          Text(
                            '2023',
                            style: TextStyle(
                              color: Colors.black, // Alterando para preto
                              fontWeight:
                                  FontWeight.bold, // Deixando em negrito
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  for (var day in [26, 27, 28, 29, 30])
                    GestureDetector(
                      onTap: () {
                        // Ação a ser executada ao clicar no dia
                        setState(() {
                          selectedDay = day; // Atualiza o dia selecionado
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          '$day',
                          style: TextStyle(
                            color: selectedDay == day
                                ? Colors
                                    .white // Se o dia for selecionado, cor branca
                                : const Color.fromARGB(
                                    147, 255, 255, 255), // Senão, cor padrão
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var atividade in atividades[selectedDay - 26])
                  Container(
                    height: 80,
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      border: Border(
                          left: BorderSide(
                        width: 4,
                        color: getRandomColor(),
                      )),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(3.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text(atividade),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

getRandomColor() {
  final Random random = Random();
  final int r = random.nextInt(256);
  final int g = random.nextInt(256);
  final int b = random.nextInt(256);
  // Retornar uma cor com os valores aleatórios
  return Color.fromARGB(255, r, g, b);
}
