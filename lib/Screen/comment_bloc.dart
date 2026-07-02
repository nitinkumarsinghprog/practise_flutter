import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise_flutter/Bloc/comment_bloc/comment_bloc.dart';

class CommentBlocScreen extends StatefulWidget {
  const CommentBlocScreen({super.key});

  @override
  State<CommentBlocScreen> createState() => _CommentBlocScreenState();
}

class _CommentBlocScreenState extends State<CommentBlocScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CommentBloc>().add(FetchCommentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Comments")),
      body: BlocConsumer<CommentBloc, CommentState>(
        listener: (context, state) {
          if (state is CommentError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is CommentLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CommentLoaded) {
            return ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                final comment = state.comments[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  color: Colors.grey[200],
                  child: ListTile(
                    title: Text(comment.body),
                    subtitle: Text(comment.user.fullName),
                  ),
                );
              },
            );
          }

          if (state is CommentError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
