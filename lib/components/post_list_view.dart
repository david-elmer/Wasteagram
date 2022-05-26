import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../screens/detail_screen.dart';

class PostListView extends StatelessWidget {
  const PostListView({Key? key}) : super(key: key);

  // ------------------------------------------------------
  // -------------------- BUILD METHOD --------------------
  // ------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').orderBy('date', descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var post = snapshot.data!.docs[index];
              return Card(
                child: ListTile(
                  title: Text(post['item']),
                  subtitle: Text('${post['quantity'].toString()} items'),
                  trailing: Text(
                    DateFormat('EEE, MMMM dd, yyyy').format(DateTime.fromMillisecondsSinceEpoch(post['date']))
                  ),
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
