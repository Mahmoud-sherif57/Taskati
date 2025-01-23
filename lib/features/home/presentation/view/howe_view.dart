import 'package:flutter/material.dart';
import 'package:taskati/features/home/presentation/widgets/home_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              // Header.
              HomeHeader()
            ],
          ),
        ),
      ),
    );
  }
}
