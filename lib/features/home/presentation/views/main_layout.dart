import 'package:flutter/material.dart';
import 'package:shop/features/home/presentation/views/home_view.dart';
import 'package:shop/features/home/presentation/views/items_view.dart';
import 'package:shop/features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:shop/features/profile/presentation/views/profile_view.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
   final List<Widget> screens = [
      HomeView(),
      ItemsView(),
      ProfileView()
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: currentIndex,
        onTap: (p0) {
          setState(() {
            currentIndex = p0;
          });
        },
        ),
      body:  IndexedStack(
      index: currentIndex,      
      children: screens,
    ),
    );
  }
}