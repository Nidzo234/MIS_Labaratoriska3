//import 'dart:js_util';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Clothes {
  String name;
  String category;
  String color;
  Clothes({required this.name,required this.category, required this.color});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MIS lab 2',
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
  String ddType = 'Jeans';
  String ddColor = 'Red';
  final List<Clothes> _itemsList = [
    Clothes(name: 'Shirt', category: 'Shirt', color: 'Blue'),
    Clothes(name: 'Jeans', category: 'Jeans', color: 'Black'),
    Clothes(name: 'Dress', category: 'Dress', color: 'Green'),
    Clothes(name: 'Jacket', category: 'Jacket', color: 'Black')
  ];

  void addNewItem() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String name = "";
          String category = "";
          String color = "";
          return AlertDialog(
            surfaceTintColor: Colors.white,
            title: const Text(
              "Add new Item",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Column(
              children: [
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.blue),
                    labelText: 'Name',
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: ddType,
                  onChanged: (value) {
                    setState(() {
                      category = value!;
                    });
                  },
                  items: ['Shirt', 'Jeans', 'Dress', 'Jacket']
                      .map<DropdownMenuItem<String>>((String t) {
                    return DropdownMenuItem<String>(
                      value: t,
                      child: Text(t),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                      labelText: 'Select Category',
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
                DropdownButtonFormField<String>(
                  value: ddColor,
                  onChanged: (value) {
                    setState(() {
                      color = value!;
                    });
                  },
                  items: ['Red', 'Blue', 'Green', 'Yellow', 'Black', 'White']
                      .map<DropdownMenuItem<String>>((String col) {
                    return DropdownMenuItem<String>(
                      value: col,
                      child: Text(col),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                      labelText: 'Select Color',
                      labelStyle: TextStyle(color: Colors.blue)),
                )

              ],
            )
            ,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.green),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (name.isNotEmpty) {
                        if (category.isEmpty) {
                          category = ddType;
                        }
                        if (color.isEmpty) {
                          color = ddColor;
                        }
                        Clothes c = Clothes(
                            name: name, category: category, color: color);
                        _itemsList.add(c);
                      }
                      Navigator.pop(context);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ))
            ],
          );
        });
  }


  void editItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          String name = _itemsList[index].name;
          TextEditingController nameController = TextEditingController(
              text: name);
          String category = _itemsList[index].category;
          String color = _itemsList[index].color;
          return AlertDialog(
            surfaceTintColor: Colors.white,
            title: const Text(
              "Edit Item",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Column(
              children: [
                TextField(
                  controller: nameController,
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: const InputDecoration(
                    labelStyle: TextStyle(color: Colors.blue),
                    labelText: 'Edit name',
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: category,
                  onChanged: (value) {
                    setState(() {
                      category = value!;
                    });
                  },
                  items: ['Shirt', 'Jeans', 'Dress', 'Jacket']
                      .map<DropdownMenuItem<String>>((String t) {
                    return DropdownMenuItem<String>(
                      value: t,
                      child: Text(t),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                      labelText: 'Edit Category',
                      labelStyle: TextStyle(color: Colors.blue)),
                ),
                DropdownButtonFormField<String>(
                  value: color,
                  onChanged: (value) {
                    setState(() {
                      color = value!;
                    });
                  },
                  items: ['Red', 'Blue', 'Green', 'Yellow', 'Black', 'White']
                      .map<DropdownMenuItem<String>>((String col) {
                    return DropdownMenuItem<String>(
                      value: col,
                      child: Text(col),
                    );
                  }).toList(),
                  decoration: const InputDecoration(
                      labelText: 'Edit Color',
                      labelStyle: TextStyle(color: Colors.blue)),
                )

              ],
            )
            ,
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.green),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _itemsList[index].name = name;
                      _itemsList[index].category = category;
                      _itemsList[index].color = color;
                      Navigator.pop(context);
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  child: const Text(
                    "Edit Item",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'All items',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _itemsList.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      _itemsList[index].name,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Color: ${_itemsList[index].category}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.grey),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Color: ${_itemsList[index].color}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.grey),
                        ),
                      ],
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          color: Colors.red,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green),
                          ),
                          icon: const Icon(Icons.delete_outline_sharp),
                          onPressed: () {
                            setState(() {
                              _itemsList.removeAt(index);
                            });
                          },
                        ),
                        IconButton(
                          color: Colors.red,
                          icon: const Icon(Icons.edit),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.green),
                          ),
                          onPressed: () {
                            editItem(index);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        onPressed: addNewItem,
        backgroundColor: Colors.blue.shade400,
        child: const Icon(Icons.add_card),
      ),
    );
  }
}
