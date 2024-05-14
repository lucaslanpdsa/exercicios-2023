// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'activityPage.dart';

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
      home: const Calendar(),
    );
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() {
    return CalendarState();
  }
}

class CalendarState extends State<Calendar> {
  int selectedDay = 26;

  List<dynamic> activities = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/chuva-inc/exercicios-2023/master/dart/assets/activities.json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        setState(() {
          final jsonData = jsonDecode(response.body);
          final List<dynamic> allActivities = jsonData['data'];
          activities.clear();
          for (final activity in allActivities) {
            final data = activity['start'];
            if (data.toString().contains('2023-11-$selectedDay')) {
              activities.add(activity);
            }
          }
        });
      } else {
        throw Exception('Falha ao carregar os dados: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro durante a requisição: $e');
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text('Erro ao carregar atividades. Por favor, tente novamente.'),
        ),
      );
    }
  }

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
                  Container(
                    padding: const EdgeInsets.all(2.0),
                    color: Colors.white, // Cor de fundo do texto "NOV"
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Nov',
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
                            fontWeight: FontWeight.bold, // Deixando em negrito
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  for (var day in [26, 27, 28, 29, 30])
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          selectedDay = day; // Atualiza o dia selecionado
                        });
                        await fetchData();
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: activities.map((e) {
                    String dataHoraStart = e['start'];
                    // Converter a string para um objeto DateTime
                    String parteInteressanteStart =
                        dataHoraStart.substring(11, 16);

                    String dataHoraEnd = e['end'];
                    String parteInteressanteEnd = dataHoraEnd.substring(11, 16);

                    // ignore: unused_local_variable, non_constant_identifier_names
                    final ActivityPageArguments = [
                      {'nome': e['title']['pt-br']},
                      {'Horas': '$dataHoraStart - $parteInteressanteEnd'},
                      {
                        'locations':
                            e['locations'].map((e) => {e['title']['pt-br']})
                      },
                      {'description': e['description']['pt-br']},
                      {
                        'peoplelabel': e['people']
                            .map((e) => {e['role']['label']['pt-br']})
                      },
                      {
                        'peopleName':
                            e['people'].map((person) => person['name'])
                      },
                      {
                        'peopleUniversity':
                            e['people'].map((person) => person['institution'])
                      },
                      {
                        'peoplePicture': e['people'].map((e) => {e['picture']})
                      }
                    ];

                    print(ActivityPageArguments[7]['peoplePicture']);

                    return Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border(
                            left: BorderSide(
                              color: getRandomColor(), // Cor da borda
                              width: 4.0,
                              // Largura da borda
                            ),
                          ),
                        ),
                        child: GestureDetector(
                            onTap: () => {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ActivityPage(
                                              title: e['title']['pt-br'],
                                              horas:
                                                  'Domingo $parteInteressanteStart - $parteInteressanteEnd',
                                              locations: e['locations'].map(
                                                  (e) => {e['title']['pt-br']}),
                                              description: e['description']
                                                  ['pt-br'],
                                              peopleLabel: e['people'].map(
                                                  (e) => {
                                                        e['role']['label']
                                                            ['pt-br']
                                                      }),
                                              peopleName: e['people'].map(
                                                  (person) => person['name']),
                                              peopleUniversity: e['people'].map(
                                                  (person) =>
                                                      person['institution']),
                                              peoplePicture: e['people']
                                                  .map((e) => {e['picture']}),
                                            )), // Passar a resposta como parâmetro
                                  )
                                },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${e['type']['title']['pt-br']} de $parteInteressanteStart até $parteInteressanteEnd',
                                  style: const TextStyle(
                                    fontSize: 10, // Tamanho da fonte
                                    fontWeight:
                                        FontWeight.w500, // Peso da fonte
                                  ),
                                ),
                                Text(
                                  '${e['title']['pt-br']}',
                                  style: const TextStyle(
                                    fontSize: 15, // Tamanho da fonte
                                    fontWeight:
                                        FontWeight.w500, // Peso da fonte
                                  ),
                                ),
                                Text(
                                  '${e['people'].map((person) => person['name']).join(', ')}',
                                  style: const TextStyle(
                                    fontSize: 12, // Tamanho da fonte
                                    fontWeight:
                                        FontWeight.w300, // Peso da fonte
                                  ),
                                )
                              ],
                            )));
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Color getRandomColor() {
  Random random = Random();
  int r = random.nextInt(256);
  int g = random.nextInt(256);
  int b = random.nextInt(256);
  return Color.fromARGB(255, r, g, b);
}
