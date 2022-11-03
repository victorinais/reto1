import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Convertidor de Moneda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class objetos {
  final titulo;
  final icono;
  final color;

  objetos(this.titulo, this.icono, this.color);
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

List<objetos> lista = <objetos>[
  objetos("7", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("8", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("9", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("4", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("5", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("6", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("1", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("2", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("3", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("Borrar", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("0", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
  objetos("Convertir", Icon(Icons.delete), Color.fromARGB(255, 99, 97, 97)),
];


  void _incrementCounter() {
    setState(() {
     
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: lista.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: lista[index].color,
            child: ListTile(
              title: Center(
                child: Text(lista[index].titulo),
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}
