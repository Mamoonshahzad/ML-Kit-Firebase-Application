import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> itemsList = [
    'Text Recognition',
    'Label Detection',
    'Barcode Scanner',
    'Face Detection'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Home Screen'),
        ),
        body: ListView.builder(
            itemCount: itemsList.length,
            itemBuilder: (context, index) {
              return Card(
                  child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailsScreen(item: itemsList[index]),
                      ));
                },
                title: Text(itemsList[index]),
              ));
            }));
  }
}
