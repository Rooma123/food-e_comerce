import 'package:flutter/material.dart';

class CatigoryItem extends StatelessWidget {
  const CatigoryItem({super.key, required this.id, required this.title, required this.image});

  final String id;
  final String title;
  final String image;

  void catigoryInfo(BuildContext context) {
    Navigator.of(context).pushNamed(
      "catigory_details",
      arguments: [id, title, image],
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>catigoryInfo(context),
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.red,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            ),
            ),
      
            Container(
              padding: EdgeInsets.all(10),
              alignment: Alignment.center,
              child: Text(title,
              style: Theme.of(context).textTheme.displayLarge,),
      
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15)
              ),
              ),
        ],
      ),
    );
  }
}