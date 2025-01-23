import 'package:flutter/material.dart';
import 'package:taskati/features/home/presentation/widgets/home_header.dart';

class HoweView extends StatefulWidget {
  const HoweView({super.key});

  @override
  State<HoweView> createState() => _HoweViewState();
}

class _HoweViewState extends State<HoweView> {
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
