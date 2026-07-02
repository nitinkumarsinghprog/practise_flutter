

import 'package:flutter/material.dart';
import 'package:practise_flutter/Provider/posts_provider.dart';
import 'package:provider/provider.dart';

class Posts extends StatelessWidget {
  const Posts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Consumer<PostsProvider>(
       builder:(context, provider, child) {
        if(provider.isLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
         
         if(provider.posts.isEmpty) {
          return const Center(
            child: Text('No Posts Found'),
          );
        }

        return ListView.builder(
          itemCount: provider.posts.length,
          itemBuilder: (context, index) {
            final post = provider.posts[index];

            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.body),
            );
          },
        );
       },
      ),
    );
  }
}