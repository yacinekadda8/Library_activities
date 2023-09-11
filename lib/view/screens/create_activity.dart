import 'package:application_bibliotheque/services/crud.dart';
import 'package:application_bibliotheque/utils/my_space.dart';
import 'package:application_bibliotheque/utils/my_styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cross_file_image/cross_file_image.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:provider/provider.dart';

import '../../const.dart';
import '../../providers/create_activity_provider.dart';

class CreateActivity extends StatefulWidget {
  const CreateActivity({super.key});

  @override
  State<CreateActivity> createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateActivityProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    // router.pop(context);
                    iconSize: 30,
                    padding: EdgeInsets.zero,
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close, size: 30),
                  ),
                  const Text(
                    "Create Activity",
                    style: MyStyles.textStyle30,
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  provider.getImage();
                },
                child: provider.selectedImage != null
                    ? Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: XFileImage(provider.selectedImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: MediaQuery.of(context).size.height / 3.5,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add_a_photo, size: 30),
                      ),
              ),
              MySpace.h20Space,
              TextField(
                decoration: const InputDecoration(
                  hintText: "Title",
                ),
                onChanged: (val) {
                  provider.title = val;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Desc",
                ),
                onChanged: (val) {
                  provider.body = val;
                },
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Author",
                ),
                onChanged: (val) {
                  provider.author = val;
                },
              ),
              MySpace.h10Space,
              ElevatedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    backgroundColor:
                        MaterialStateProperty.all<Color>(kgreyColor),
                  ),
                  onPressed: () {
                    provider.uploadActivities(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Publish'),
                      IconButton(
                        iconSize: 30,
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(Icons.upload_rounded, size: 30),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
