import 'package:flutter/material.dart';
import '../screens/detail_screen.dart';

class PostListView extends StatelessWidget {
  PostListView({Key? key}) : super(key: key);

  final posts = [
    {
      'date': '1/1/2020',
      'image': 'image',
      'numberOfItems': 5,
      'latitude': 100,
      'longitude': 100
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${posts[index]['date']}'),
              Text('${posts[index]['numberOfItems']}')
            ],
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(post: posts[index])
              )
            );
          },
          
          
          
        );
      },
    );
  }

}