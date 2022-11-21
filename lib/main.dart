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
      home: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: Text('Tarefas'),
        ),
        body: ListView(
          children: [
            Task('Aprender Flutter: Aula 401, depois de já ter aprendido Dart corretamente'),
            Task('Andar de Bike'),
            Task('Correr'),
            Task('Correr'),
            Task('Correr'),
            Task('Correr'),
            Task('Dormir')
          ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){}),
      ),
    );
  }
}

class Task extends StatefulWidget {
  final String nome;
  const Task(this.nome, {Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            color: Colors.blue,
            height: 140,
          ),
          Column(
            children: [
              Container(
                color: Colors.white,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: Colors.black26,
                      width: 72,
                      height: 100,
                    ),
                    Container(
                      width: 200,
                        child: Text(
                          widget.nome,
                          style: TextStyle(
                              fontSize: 24,
                              overflow: TextOverflow.ellipsis
                          ),
                        )
                    ),
                    Container(
                      height: 52,
                      width: 52,
                      child: ElevatedButton(
                          onPressed: () {
                            setState((){
                              nivel++;
                            });
                            print(nivel);
                          },
                          child: Column(
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text('UP', style: TextStyle(fontSize: 12),)
                            ],
                          )
                      )
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        value: nivel/10
                      )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Nível: $nivel', style: TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }
}
