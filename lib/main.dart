import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

TextEditingController bpm = TextEditingController();
TextEditingController song = TextEditingController();
TextEditingController name = TextEditingController();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authism BPM',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Authism BPM'),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Ingresa el nombre',
              labelText: 'Nombre:',
            ),
          ),
          TextFormField(
            controller: bpm,
            decoration: const InputDecoration(
              icon: Icon(Icons.timelapse),
              hintText: 'Ingresa las pulsaciones por minuto',
              labelText: 'Pulsaciones:',
            ),
          ),
          TextFormField(
            controller: song,
            decoration: const InputDecoration(
              icon: Icon(Icons.music_note),
              hintText: 'Ingresa la cancion',
              labelText: 'Cancion:',
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 150.0, top: 40.0),
            child: RaisedButton(
              child: const Text('Calcular'),
              onPressed: () async {
                var url = Uri.https(
                    'vfzbonvle0.execute-api.us-east-1.amazonaws.com',
                    '/fase1/',
                    {'bmp': bpm.text, 'bmpSong': song.text, 'name': name.text});

                var response = await get(url);
                print(url);
                print(response.body);
              },
            ),
          ),
        ],
      ),
    );
  }
}
