import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/detail_screen.dart';

class PostListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData &&
            snapshot.data!.docs != null &&
            snapshot.data!.docs.length > 0) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var post = snapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  trailing: Text(
                    post['date']),
                  title: Text(post['item']),
                  subtitle: Text('${post['quantity'].toString()} items'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(post: post)
                      )
                    );
                  },
                ),
              );
            }
          );
        } else {
          return const Center(child: Text('No posts to display'));
        }
      }
    );
  }
}
