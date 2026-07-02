import 'package:flutter/material.dart';
import 'package:practise_flutter/Provider/comment_provider.dart';
import 'package:provider/provider.dart';

class CommentProviderScreen extends StatefulWidget {
  const CommentProviderScreen({super.key});

  @override
  State<CommentProviderScreen> createState() => _CommentProviderScreenState();
}

class _CommentProviderScreenState extends State<CommentProviderScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CommentProvider>().fetchComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Comment Provider Screen")),
      body: Consumer<CommentProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.comments.isEmpty) {
            return const Center(child: Text('No Comments Found'));
          }

          return ListView.builder(
            itemCount: provider.comments.length,
            itemBuilder: (context, index) {
              final comment = provider.comments[index];

              return Card(
                margin: const EdgeInsets.all(10),
                color: Colors.brown[200],
                child: ListTile(
                  title: Text(comment.body),
                  subtitle: Text(comment.user.fullName),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
