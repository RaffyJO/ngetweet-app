import 'package:flutter/material.dart';
import 'package:ngetweet/shared/methods.dart';
import 'package:ngetweet/shared/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
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
              Row(
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
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/img-profile.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
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
                          style: blueTextStyle.copyWith(
                              fontSize: 14, fontWeight: semiBold),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
