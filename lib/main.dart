import 'dart:html';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Grupo 2',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Conversor de Moneda'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

final textorigen = TextEditingController();
final textdestino = TextEditingController();

class objetos {
  final titulo;
  final icono;
  final color;

  objetos(this.titulo, this.icono, this.color);
}
String op1 = "USD";
String op2 = "COP";

List<DropdownMenuItem<String>> monedas = <DropdownMenuItem<String>>[
  DropdownMenuItem(
    child: Text("USD"),
    value: "USD",
    ),
    DropdownMenuItem(
    child: Text("EUR"),
    value: "EUR",
    ),
    DropdownMenuItem(
    child: Text("COP"),
    value: "COP",
    ),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

List<objetos> lista = <objetos>[
  objetos("9", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("8", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("7", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("6", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("5", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("4", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("3", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("2", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("1", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("0", Icon(Icons.abc), Color.fromARGB(255, 177, 167, 167)),
  objetos("Borrar", Icon(Icons.delete), Color.fromARGB(255, 177, 167, 167)),
  objetos("Convertir", Icon(Icons.calculate), Color.fromARGB(255, 177, 167, 167)),
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("origen:  "),
              DropdownButton(
                value: op1,
                items: monedas, onChanged: (String? x) {
                  setState(() {
                    op1 = x.toString();
                  });
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("destino:  "),
              DropdownButton(
                value: op2,
                items: monedas, onChanged: (String? x) {
                  setState(() {
                    op2 = x.toString();
                  });
                }),
            ]),
            ]),
            TextField(
              textAlign: TextAlign.center,
              controller: textorigen,
              decoration: InputDecoration(icon: Icon(Icons.arrow_circle_right_outlined,), labelText: "origen", hintText: "0",),
            ),
            TextField(
              textAlign: TextAlign.center,
              controller: textdestino,
              decoration: InputDecoration(icon: Icon(Icons.currency_exchange), labelText: "destino", hintText: "0"),
            ),
            Expanded(
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
                child: index > 9
                ? lista[index].icono
                : Text(lista[index].titulo,
                style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold,),),
                  ),
                  onTap: () {
                    print(lista[index].titulo);

                    if (index < 10) {
                      textorigen.text = textorigen.text + lista[index].titulo;
                    } else if (index == 10) {
                      textorigen.text = "";
                      textdestino.text = "";
                    } else {
                      if (op1 == "USD" && op2 == "COP"){
                        textdestino.text = 
                        (double.parse(textorigen.text) * 5018)
                        .toString();
                      } else if (op1 == "COP" && op2 == "USD"){
                        textdestino.text = 
                        (double.parse(textorigen.text) / 5018)
                        .toString();
                      } else if (op1 == "EUR" && op2 == "COP"){
                        textdestino.text = 
                        (double.parse(textorigen.text) * 4965)
                        .toString();
                      } else if (op1 == "COP" && op2 == "EUR"){
                        textdestino.text = 
                        (double.parse(textorigen.text) / 4965)
                        .toString();
                      } else if (op1 == "EUR" && op2 == "USD"){
                        textdestino.text = 
                        (double.parse(textorigen.text) * 0.99)
                        .toString();
                      } else if (op1 == "USD" && op2 == "EUR"){
                        textdestino.text = 
                        (double.parse(textorigen.text) / 0.99)
                        .toString();
                      } else {
                        textdestino.text = textdestino.text;
                      }
                    }
                    
                  },
                ),
              );
            },
          ),)
          ],
        )
        )
    );
  }
}
