import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/detail_screen.dart';

class PostListView extends StatelessWidget {

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
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData &&
            snapshot.data!.docs != null &&
            snapshot.data!.docs.length > 0) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var post = snapshot.data!.docs[index];
              return ListTile(
                leading: Text(
                  post['date']),
                trailing: Text(post['quantity'].toString()),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(post: post)
                    )
                  );
                },
              );
            }
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }
    );

  }
}
    // return ListView.builder(
    //   itemCount: posts.length,
    //   itemBuilder: (context, index) {
    //     return ListTile(
    //       title: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           Text('${posts[index]['date']}'),
    //           Text('${posts[index]['numberOfItems']}')
    //         ],
    //       ),
    //       onTap: () {
    //         Navigator.of(context).push(
    //           MaterialPageRoute(
    //             builder: (context) => DetailScreen(post: posts[index])
    //           )
    //         );
    //       },
    //     );
    //   },
    // );
  //}

