import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngetweet/blocs/auth/auth_bloc.dart';
import 'package:ngetweet/shared/methods.dart';
import 'package:ngetweet/shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: blueColor,
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthInitial) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is AuthSuccess) {
            return ListView(
              children: [
                verticalSpace(20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.user.name,
                    ),
                    Text(
                      state.user.nickname,
                    ),
                    Text(
                      state.user.email,
                    ),
                    TextButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthLogout());
                      },
                      child: const Text('Logout'),
                    )
                  ],
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
