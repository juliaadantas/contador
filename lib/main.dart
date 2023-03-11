import 'package:flutter/material.dart';

import 'SecondPage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            color: Color.fromRGBO(136, 5, 5, 1),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(136, 5, 5, 1),
            brightness: Brightness.dark,
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstPage(),
        '/segundaPagina': (context) => const SecondPage(),
      },
    ),
  );
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPage();
}

class _FirstPage extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    Widget botoes = Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10.0),
          height: 150.0,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              Padding(padding: const EdgeInsets.all(5.0)),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondPage()),
                  );
                },
                child: _icones(Icons.person, 'Contador'),
              ),
              SizedBox(
                width: 20,
              ),
              _icones(Icons.restaurant, 'Cardápio'),
              SizedBox(
                width: 20,
              ),
              _icones(Icons.table_restaurant, 'Reservas'),
              SizedBox(
                width: 20,
              ),
            ],
          ),
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Restaurante',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0,
              fontFamily: 'IndieFlower',
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    border: Border.all(width: 8, color: Colors.white)),
                child: ClipRRect(
                  child: Image.asset('Imagens/restaurante.jpg'),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              Padding(padding: const EdgeInsets.all(10)),
              botoes,
            ],
          ),
        ),
      ),
    );
  }

  Column _icones(IconData icon, String label) {
    return Column(
      children: [
        Container(
          height: 150.0,
          width: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(136, 5, 5, 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 80),
              Text(label,
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                    fontFamily: 'IndieFlower',
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
