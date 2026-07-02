import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practise_flutter/Cubit/UserCubit/user_cubit.dart';
import 'package:practise_flutter/Cubit/UserCubit/user_state.dart';

class UserCubitScreen extends StatefulWidget {
  const UserCubitScreen({super.key});

  @override
  State<UserCubitScreen> createState() => _UserCubitScreenState();
}

class _UserCubitScreenState extends State<UserCubitScreen> {
  @override
  void initState() {
    super.initState();

    context.read<UserCubit>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is UserLoadedState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];

                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.image),
                  ),
                  title: Text(
                    "${user.firstName} ${user.lastName}",
                  ),
                  subtitle: Text(user.email),
                );
              },
            );
          }

          if (state is UserErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }

          return const Center(
            child: Text("No Users Found"),
          );
        },
      ),
    );
  }
}