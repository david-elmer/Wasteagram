import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailScreen extends StatelessWidget {

  QueryDocumentSnapshot<Object?> post;

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
            Center(child: Text(
              '${post['date']}',
              style: Theme.of(context).textTheme.headline5
              )
            ),
            Center(child: Semantics(
                child: Image.network(post['imageURL']),
                image: true,
                label: 'Food waste item image'
              ),
            ),
            Center(child: Text(
              'Item: ${post['item']}',
              style: Theme.of(context).textTheme.headline5
              )
            ),
            Center(child: Text(
              '${post['quantity'].toString()} items',
              style: Theme.of(context).textTheme.headline5
              )
            ),
            Center(child: Text(
              'Location: (${post['latitude'].toString()}, ${post['longitude'].toString()})',
              style: Theme.of(context).textTheme.subtitle1
              )
            )
          ],
        ),
      ),
    );
  }

}