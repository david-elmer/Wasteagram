import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  Map<String, dynamic> post;

  DetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasteagram'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Text('${post['date']}')),
            Center(child: Text('${post['image']}')),
            Center(child: Text('${post['numberOfItems']} items')),
            Center(child: Text('Location: (${post['latitude']}, ${post['longitude']})'))
          ],
        ),
      ),
    );
  }

}