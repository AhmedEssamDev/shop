import 'package:flutter/material.dart';
import 'package:shop/features/home/presentation/views/widgets/main_layout_body.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MainLayoutBody(),
    );
  }
}