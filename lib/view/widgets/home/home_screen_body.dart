import 'package:application_bibliotheque/services/crud.dart';
import 'package:application_bibliotheque/utils/my_styles.dart';
import 'package:application_bibliotheque/view/widgets/home/activity_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/home/home_provider.dart';

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
            Container(
              child: provider.isloading == true
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: provider.data.length,
                      itemBuilder: (context, index) {
                        var data = provider.data[index];
                        //     as Map<String, dynamic>;
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: ActivityTile(
                            imgUrl: data['imageUrl'],
                            title: data['activiteTitle'],
                            body: data['activiteDescription'],
                            author: data['activiteAuthor'],
                          ),
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }
}
