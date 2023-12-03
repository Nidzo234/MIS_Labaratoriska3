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
      title: 'MIS lab 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple.shade50),
        useMaterial3: true,
      ),
      home: const SubjectListScreen(),
    );
  }
}

class SubjectListScreen extends StatefulWidget {
  const SubjectListScreen({super.key});

  @override
  State<SubjectListScreen> createState() => _SubjectListScreenState();
}

class _SubjectListScreenState extends State<SubjectListScreen> {
  final List<String> _subjects = [
    "Вовед во наука на податоци",
    "Тимски проект",
    "Мобилни информациски системи",
    "Мобилни платформи и програмирање",
    "Интернет програмирање на клиентска веб страна",
    "Програмирање на видео игри"
  ];

  void addSubject() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String newSubject = "";
          return AlertDialog(
            surfaceTintColor: Colors.white,
            title: const Text(
              "Add new subject",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: TextField(
              onChanged: (value) {
                newSubject = value;
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (newSubject.isNotEmpty) {
                        _subjects.add(newSubject);
                      }
                      Navigator.pop(context);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "201163",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue.shade400,
      ),
      body: ListView.builder(
          itemCount: _subjects.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: ListTile(
                title: Text(
                  _subjects[index],
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                  color: Colors.red.shade900,
                  icon: const Icon(Icons.delete_outline_sharp),
                  onPressed: () {
                    setState(() {
                      _subjects.removeAt(index);
                    });
                  },
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        onPressed: addSubject,
        backgroundColor: Colors.blue.shade400,
        child: const Icon(Icons.add_card),
      ),
    );
  }
}
