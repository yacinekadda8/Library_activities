import 'package:application_bibliotheque/services/crud.dart';
import 'package:application_bibliotheque/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/home_provider.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  CrudMethods crudMethods = CrudMethods();
  late HomeController provider;

  @override
  void initState() {
    super.initState();
    provider = Provider.of<HomeController>(context, listen: false);
    //provider.init();
    provider.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomeController>(context);

    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Home Page",
                    style: MyStyles.textStyle30,
                  ),
                  IconButton(
                    onPressed: () {
                      provider.logout(context);
                    },
                    icon: const Icon(Icons.exit_to_app_rounded, size: 30),
                  ),
                ],
              ),
            ),

                provider.activitiesList(),
              
            
          ],
        ),
      ),
    );
  }
}
