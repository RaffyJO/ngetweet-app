import 'package:flutter/material.dart';
import 'package:ngetweet/shared/theme.dart';
import 'package:ngetweet/views/pages/communities/communities_page.dart';
import 'package:ngetweet/views/pages/home/home_page.dart';
import 'package:ngetweet/views/pages/message/message_page.dart';
import 'package:ngetweet/views/pages/notification/notification_page.dart';
import 'package:ngetweet/views/pages/search/search_page.dart';
import 'package:ngetweet/views/widgets/bottom_nav_bar.dart';
import 'package:ngetweet/views/widgets/bottom_nav_bar_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController pageController = PageController();
  int selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) => setState(() {
              selectedPage = value;
            }),
            children: const [
              HomePage(),
              SearchPage(),
              CommunitiesPage(),
              NotificationPage(),
              MessagePage(),
            ],
          ),
          BottomNavBar(
            items: [
              BottomNavBarItem(
                index: 0,
                isSelected: selectedPage == 0,
                icon: Icon(
                  Icons.home,
                  color: greyColor,
                ),
                selectedIcon: Icon(
                  Icons.home,
                  color: blueColor,
                ),
              ),
              BottomNavBarItem(
                index: 1,
                isSelected: selectedPage == 1,
                icon: Icon(
                  Icons.search_outlined,
                  color: greyColor,
                ),
                selectedIcon: Icon(
                  Icons.search_outlined,
                  color: blueColor,
                ),
              ),
              BottomNavBarItem(
                index: 2,
                isSelected: selectedPage == 2,
                icon: Icon(
                  Icons.people_outline_sharp,
                  color: greyColor,
                ),
                selectedIcon: Icon(
                  Icons.people_outline_sharp,
                  color: blueColor,
                ),
              ),
              BottomNavBarItem(
                index: 3,
                isSelected: selectedPage == 3,
                icon: Icon(
                  Icons.notifications_outlined,
                  color: greyColor,
                ),
                selectedIcon: Icon(
                  Icons.notifications_outlined,
                  color: blueColor,
                ),
              ),
              BottomNavBarItem(
                index: 4,
                isSelected: selectedPage == 4,
                icon: Icon(
                  Icons.mail_outline_outlined,
                  color: greyColor,
                ),
                selectedIcon: Icon(
                  Icons.mail_outline_outlined,
                  color: blueColor,
                ),
              ),
            ],
            onTap: (index) {
              selectedPage = index;

              pageController.animateToPage(selectedPage,
                  duration: const Duration(milliseconds: 100),
                  curve: Curves.easeInOut);
            },
            selectedIndex: 0,
          )
        ],
      ),
    );
  }
}
