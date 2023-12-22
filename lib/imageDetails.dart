
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';    // Import your PhotoModel
import 'package:gallery_saver/gallery_saver.dart';

class ImageDetailPage extends StatelessWidget {
  String image;
  ImageDetailPage({required this.image});
  Future<void> downloadAndSaveImage(String imageUrl) async {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final appDir = await getTemporaryDirectory();
      final fileName = imageUrl.split('/').last;
      final filePath = '${appDir.path}/$fileName';
      await File(filePath).writeAsBytes(response.bodyBytes);
      await GallerySaver.saveImage(filePath);

      print('Image saved to gallery');

    } else {
      print('Failed to download image');

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Review"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => Center(
                child: Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                        strokeWidth: 4, value: downloadProgress.progress),
                  ),
                ),
              ),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error),
            ),
            SizedBox(height: 8),
            // Text(
            //   image.altDescription ?? 'No description available',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            SizedBox(height: 8),
            // Add more image details as needed
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width:8),
          RawMaterialButton(
            onPressed: () {
              // download functionality here
              print('Button pressed!');
              downloadAndSaveImage(image);
            },
            fillColor: Colors.orangeAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.download, color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Save',
                    style: TextStyle(color: Colors.white,fontSize: 12,fontWeight:FontWeight.bold),
                  ),
                ),
                SizedBox(width:8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




