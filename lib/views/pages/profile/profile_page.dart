import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ngetweet/blocs/auth/auth_bloc.dart';
import 'package:ngetweet/shared/methods.dart';
import 'package:ngetweet/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 138,
                      child: Image.asset(
                        'assets/img-top-profile.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    verticalSpace(11),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 72,
                                width: 72,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Container(
                                    height: 68,
                                    width: 68,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: (state.user.avatar == '')
                                          ? const DecorationImage(
                                              image: AssetImage(
                                                'assets/img-profile-default.jpg',
                                              ),
                                              fit: BoxFit.cover,
                                            )
                                          : DecorationImage(
                                              image: NetworkImage(
                                                state.user.avatar.toString(),
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                    ),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  context.read<AuthBloc>().add(AuthLogout());
                                },
                                child: Container(
                                  width: 93,
                                  height: 32,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                      color: blueColor,
                                      width: 1,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Edit profile',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: semiBold,
                                        color: blueColor,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          verticalSpace(10),
                          Text(
                            state.user.name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: bold,
                            ),
                          ),
                          Text(
                            "@${state.user.nickname}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: regular,
                              color: greyColor,
                            ),
                          ),
                          verticalSpace(12),
                          Text(
                            'Digital Goodies Team - Web & Mobile UI/UX development; Graphics; Illustrations',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: regular,
                            ),
                          ),
                          verticalSpace(6),
                          Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_month_outlined,
                                    size: 15,
                                  ),
                                  horizontalSpace(4),
                                  Text(
                                    'Joined ${formateDate(
                                      state.user.createdAt.toString(),
                                    )}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: regular,
                                      color: greyColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          verticalSpace(8),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '217',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  horizontalSpace(4),
                                  Text(
                                    'Following',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: regular,
                                      color: greyColor,
                                    ),
                                  )
                                ],
                              ),
                              horizontalSpace(10),
                              Row(
                                children: [
                                  Text(
                                    '118',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: bold,
                                    ),
                                  ),
                                  horizontalSpace(4),
                                  Text(
                                    'Followers',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: regular,
                                      color: greyColor,
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
