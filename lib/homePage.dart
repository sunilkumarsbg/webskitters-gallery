import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:photo/Controller/imageController.dart';
import 'package:photo/imagesList.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImageController imageController = Get.put(ImageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Photo"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        body: Expanded(
          child: Obx(() {
            if (imageController.isLoading.value)
              return Center(child: CircularProgressIndicator());
            else
              return StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: imageController.imagesList.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return ImagesTile(imageController.imagesList[index]);
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
              );
          }),
        ));
  }
}
