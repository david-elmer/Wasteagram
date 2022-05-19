import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DetailScreen extends StatelessWidget {

  final QueryDocumentSnapshot<Object?> post;

  const DetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasteagram'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              '${post['date']}',
              style: Theme.of(context).textTheme.headline5
            ),
          Semantics(
            child: Image.network(post['imageURL']),
            image: true,
            label: 'Food waste item image'
          ),
          Text(
            'Item: ${post['item']}',
            style: Theme.of(context).textTheme.headline5
          ),
          Text(
            '${post['quantity'].toString()} items',
            style: Theme.of(context).textTheme.headline5
          ),
          Text(
            'Location: (${post['latitude'].toString()}, ${post['longitude'].toString()})',
            style: Theme.of(context).textTheme.subtitle1
          )
        ],
      ),
    );
  }

}