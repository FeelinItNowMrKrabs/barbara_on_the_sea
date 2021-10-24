import 'package:barbara_on_the_sea/constants/constants.dart';
import 'package:barbara_on_the_sea/pages/home_page.dart';
import 'package:barbara_on_the_sea/provider/bottom_nav_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigation = ref.watch(bottomNavProvider);

    return Scaffold(
      extendBody: true,
      body: currentScreen(navigation.index),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        elevation: 0.0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Constants.primaryWhite,
        currentIndex: navigation.index,
        onTap: (index) {
          ref.read(bottomNavProvider.notifier).selectPage(index);
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Constants.primaryWhite,
            label: "Home",
            icon: Icon(
              Icons.home,
              color: Constants.primaryWhite,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Constants.primaryWhite,
            label: "Discover",
            icon: Icon(
              Icons.search,
              color: Constants.primaryWhite,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Constants.primaryWhite,
            label: "",
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: Constants.primaryWhite,
              size: 35,
            ),
          ),
          BottomNavigationBarItem(
            label: "Love",
            icon: Icon(
              Icons.favorite,
              color: Constants.primaryWhite,
            ),
          ),
          BottomNavigationBarItem(
            label: "Me",
            icon: Icon(
              Icons.person,
              color: Constants.primaryWhite,
            ),
          ),
        ],
      ),
    );
  }

  Widget currentScreen(int index) {
    switch (index) {
      case 0:
        return HomePage();
      case 1:
        return HomePage();
      case 2:
        return HomePage();
      case 3:
        return HomePage();
      case 4:
        return HomePage();

      default:
        return HomePage();
    }
  }
}
