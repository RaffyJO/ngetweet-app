import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngetweet/blocs/auth/auth_bloc.dart';
import 'package:ngetweet/shared/theme.dart';
import 'package:ngetweet/views/pages/home_page.dart';
import 'package:ngetweet/views/pages/login/login_page.dart';
import 'package:ngetweet/views/pages/register/register_page.dart';
import 'package:ngetweet/views/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => AuthBloc()..add(AuthGetCurrentUser())),
      ],
      child: MaterialApp(
        title: 'NgeTweet',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: blueColor),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/login': (context) => LoginPage(),
          '/register': (context) => RegisterPage(),
          '/home-page': (context) => const HomePage(),
        },
      ),
    );
  }
}
