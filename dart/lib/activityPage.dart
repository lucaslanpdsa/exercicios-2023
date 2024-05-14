// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ActivityPage extends StatefulWidget {
  final String title;
  final String horas;
  final dynamic locations;
  final String description;
  final dynamic peopleLabel;
  final dynamic peopleName;
  final dynamic peopleUniversity;
  final dynamic peoplePicture;

  const ActivityPage({
    super.key,
    required this.title,
    required this.horas,
    required this.locations,
    required this.description,
    required this.peopleLabel,
    required this.peopleName,
    required this.peopleUniversity,
    required this.peoplePicture,
  });

  @override
  State<ActivityPage> createState() => ActivityPageState();
}

class ActivityPageState extends State<ActivityPage> {
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
        title: const Text(
          'Chuva 💜 Flutter',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      widget.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Color.fromARGB(255, 3, 133, 240),
                        size: 15,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        widget.horas,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Color.fromARGB(255, 3, 133, 240),
                        size: 15,
                      ),
                      const SizedBox(width: 3),
                      Text(
                        widget.locations
                            .toString()
                            .replaceAll(RegExp(r'[{}()]'), ''),
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                onPressed: () {
                  // Implemente aqui a ação ao pressionar o botão
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 58, 120, 195),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Adicione à sua agenda',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              child: Text(
                widget.description.toString(),
                style: TextStyle(),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      width: double.infinity,
                      child: Text(
                        widget.peopleLabel
                            .toString()
                            .replaceAll(RegExp(r'[()\[\]{}]'), ''),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 100, // Defina a largura máxima da imagem aqui
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(widget.peoplePicture
                              .toString()
                              .replaceAll(RegExp(r'[()\[\]{}]'), '')),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.peopleName
                                  .toString()
                                  .replaceAll(RegExp(r'[()\[\]{}]'), ''),
                            ),
                            Text(
                              widget.peopleLabel.toString().replaceAll(
                                  RegExp(r'[()\[\]{}]'),
                                  ''), // Definindo o alinhamento do texto
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
