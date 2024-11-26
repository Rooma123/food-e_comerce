import 'package:flutter/material.dart';
import '../screens/catigory_item.dart';
import '../classesanddata/app_data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String name = ModalRoute.of(context)?.settings.arguments as String? ?? 'Guest';

    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Color.fromARGB(255, 246, 180, 192),
        title: Text("Welome $name",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black)),
        ),
        body: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 7/8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10),

            children: catigoryList.map((catData) {
          return CatigoryItem(
            id: catData.id,
            title: catData.title,
            image: catData.image,
          );
        }).toList(),
            ),
    );
  }
}