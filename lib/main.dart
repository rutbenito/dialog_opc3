import 'package:flutter/material.dart';

void main() => runApp(const MyApp()); //el programa crida a MyApp

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recuperar el valor d''un camp de text',
      home: MyCustomForm(), //MyApp visualitza pantalla principal
    );
  }
}

class MyCustomForm extends StatefulWidget { //ens permet donar resposta a una accio amb la classe _MycustomFormState
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> { //per programar la resposta que volem donar
  final myController = TextEditingController(); //definim el tipus de controller

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) { //build indica quants components coloquem a la pantalla
    return Scaffold(
      appBar: AppBar( //crea appbar
        title: const Text('Recuperar el valor d\'un camp de text'), //donem valor al missatge superior amb format text
        backgroundColor: Color.alphaBlend(Colors.green, Colors.green), //canviem el color de l appbar
      ),
      body: Padding( //afegeix padding
        padding: const EdgeInsets.all(16.0),
        child: TextField( //posem un textfield, que es controla amb la classe mycontroller
          controller: myController,
        ),
      ),
      floatingActionButton: FloatingActionButton( //crea actionbutton
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text ('Alerta'),
                  content: Text(myController.text),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                      )
                  ],
                );
             }
             );
        },
        backgroundColor: Color.alphaBlend(Colors.green, Colors.green),
        tooltip: 'Mostra el valor!',
        child: const Icon(Icons.text_fields),
      ), //boto amb format icon, mostra text quan passem per sobre, quan l apretem apareix un dialeg
    );
  }
}