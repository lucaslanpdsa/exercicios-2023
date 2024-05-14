import 'package:flutter/material.dart';

class PeoplePage extends StatefulWidget {
  final dynamic peopleUniversity;
  final dynamic peopleName;
  final dynamic peoplePicture;
  final dynamic peopleBio;

  const PeoplePage({
    super.key,
    required this.peopleUniversity,
    required this.peopleName,
    required this.peoplePicture,
    required this.peopleBio,
  });

  @override
  State<PeoplePage> createState() {
    return PeoplePageState();
  }
}

class PeoplePageState extends State<PeoplePage> {
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
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
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
                          style: const TextStyle(fontSize: 22),
                        ),
                        Text(
                          widget.peopleUniversity
                              .toString()
                              .replaceAll(RegExp(r'[()\[\]{}]'), ''),
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                'Bio',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              widget.peopleBio.toString().replaceAll(RegExp(r'[()\[\]{}]'), ''),
            )
          ],
        ),
      ),
    );
  }
}
