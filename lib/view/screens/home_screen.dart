import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/home/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(child: HomeScreenBody()),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/createActivity'),
        child: Icon(Icons.add, size: 40),
      ),
    );
  }
}
