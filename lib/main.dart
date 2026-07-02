import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise_flutter/Bloc/posts_bloc/posts_bloc.dart';
import 'package:practise_flutter/Bloc/quote_bloc/quote_bloc.dart';
import 'package:practise_flutter/Cubit/ProductCubit/product_cubit.dart';
import 'package:practise_flutter/Cubit/UserCubit/user_cubit.dart';
import 'package:practise_flutter/Provider/counter_provider.dart';
import 'package:practise_flutter/Provider/posts_provider.dart';
import 'package:practise_flutter/Provider/user_provider.dart';
import 'package:practise_flutter/Repository/post_repository.dart';
import 'package:practise_flutter/Repository/product_repository.dart';
import 'package:practise_flutter/Repository/quote_repository.dart';
import 'package:practise_flutter/Repository/user_repository.dart';
import 'package:practise_flutter/Screen/posts.dart';
import 'package:practise_flutter/Screen/posts_bloc.dart';
import 'package:practise_flutter/Screen/products_screen_using_cubit.dart';
import 'package:practise_flutter/Screen/provider_example.dart';
import 'package:practise_flutter/Screen/quote_screen.dart';
import 'package:practise_flutter/Screen/user_cubit_screen.dart';
import 'package:practise_flutter/Screen/user_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Counterprovider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => PostsProvider()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => UserCubit(UserRepository())),
          BlocProvider(create: (_) => ProductCubit(ProductRepository())),
          BlocProvider(create: (_) => PostsBloc(PostRepository())),
          BlocProvider(create: (_) => QuoteBloc(QuoteRepository())),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Screen")),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProviderExample()),
                );
              },
              child: const Text("Go to Provider Example"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UserScreen()),
                );

                await context.read<UserProvider>().fetchUsers();
              },
              child: const Text("Go to User Screen"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Posts()),
                );

                await context.read<PostsProvider>().fetchPosts();
              },
              child: const Text("Go to Posts Screen"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const UserCubitScreen()),
                );
              },
              child: const Text("Go to User Cubit Screen"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ProductScreen()),
                );
              },
              child: const Text("Go to Products Cubit Screen"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PostsBlocScreen()),
                );
              },
              child: const Text("Go to Posts screen using Bloc"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QuotesScreen()),
                );
              },
              child: const Text("Go to Quotes Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
