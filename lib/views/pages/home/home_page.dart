import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngetweet/blocs/auth/auth_bloc.dart';
import 'package:ngetweet/blocs/tweet/tweet_bloc.dart';
import 'package:ngetweet/shared/theme.dart';
import 'package:ngetweet/views/widgets/tweet_item.dart';

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
        leading: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/profile-page');
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is AuthSuccess) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                  child: (state.user.avatar == '')
                      ? ClipOval(
                          child: Image.asset(
                            'assets/img-profile-default.jpg',
                            fit: BoxFit.cover,
                          ),
                        )
                      : ClipOval(
                          child: Image.network(
                            state.user.avatar.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                );
              }
              return Padding(
                padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                child: ClipOval(
                  child: Image.asset(
                    'assets/img-profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        elevation: 0.0,
        title: Image.asset(
          'assets/logo-twitter-no-bg.png',
          height: 35,
        ),
        centerTitle: true,
        backgroundColor: whiteColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: 25,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey, // Warna border
            height: 0.5,
          ),
        ),
      ),
      body: BlocConsumer<TweetBloc, TweetState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is TweetLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is TweetSuccess) {
            return (state.tweet.isNotEmpty)
                ? ListView.builder(
                    itemCount: state.tweet.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          TweetItem(
                            tweet: state.tweet[index],
                          ),
                          const Divider()
                        ],
                      );
                    },
                  )
                : const CircularProgressIndicator();
          }
          return Container();
        },
      ),
    );
  }
}
