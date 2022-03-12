import 'package:flutter/material.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import 'detail_screen.dart';
import 'new_post_screen.dart';
import '../components/post_list_view.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasteagram'),
      ),
      body: PostListView(),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const NewPostScreen())
              );
            },
            child: const Icon(Icons.camera_alt)
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}