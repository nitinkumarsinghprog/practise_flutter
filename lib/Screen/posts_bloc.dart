import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise_flutter/Bloc/posts_bloc/posts_bloc.dart';

class PostsBlocScreen extends StatefulWidget {
  const PostsBlocScreen({super.key});

  @override
  State<PostsBlocScreen> createState() => _PostsBlocScreenState();
}

class _PostsBlocScreenState extends State<PostsBlocScreen> {
  @override
  void initState() {
    super.initState();

    context.read<PostsBloc>().add(FetchPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Posts")),

      body: BlocConsumer<PostsBloc, PostsState>(
        listener: (context, state) {
          if (state is PostsError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },

        builder: (context, state) {
          if (state is PostsInitial) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PostsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is PostsLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  ),
                );
              },
            );
          }

          if (state is PostsError) {
            return Center(child: Text(state.message));
          }

          return const SizedBox();
        },
      ),
    );
  }
}
