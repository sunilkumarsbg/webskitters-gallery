import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:photo/Controller/imageController.dart';
import 'package:photo/imagesList.dart';
import 'package:photo/resource/color.dart';
import 'package:photo/resource/function.dart';

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
        appBar: const CustomAppBar(
          titleText: 'Photo',
          backgroundColor: ColorSelect.primaryColor,
        ),
        body: Obx(() {
          if (imageController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: imageController.imagesList.length,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {
                return ImagesTile(imageController.imagesList[index]);
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            );
          }
        }));
  }
}
