import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/home/home_screen_body.dart';
import 'package:provider/provider.dart';
import '../../../providers/home/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<HomeController>(context, listen: false);
    provider.intData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: const SafeArea(
          child: HomeScreenBody(),
        ),
        floatingActionButton: Consumer<HomeController>(
          builder: (context, provider, child) {
            return provider.isAdmin == true
                ? FloatingActionButton(
                    onPressed: () {
                      GoRouter.of(context).push('/createActivity');
                    },
                    child: const Icon(Icons.add, size: 40),
                  )
                : const SizedBox();
          },
        ));
  }
}
