import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Import your PhotoModel
import 'package:gallery_saver/gallery_saver.dart';
import 'package:photo/resource/color.dart';
import 'package:photo/resource/function.dart';
import 'package:collection/collection.dart';

class ImageDetailPage extends StatelessWidget {
  String image;

  ImageDetailPage({required this.image});

  Future<void> downloadAndSaveImage(String imageUrl) async {
    try {
      final response = await http.get(Uri.parse(imageUrl));
      if (response.statusCode == 200) {
        final appDir = await getTemporaryDirectory();
        final fileName = 'image.jpg'; // Default name if URL doesn't have a filename
        final filePath = '${appDir.path}/$fileName';
        await File(filePath).writeAsBytes(response.bodyBytes);
        bool isImage = await validateImage(filePath);
        if (isImage) {
          await GallerySaver.saveImage(filePath);
          print('Image saved to gallery');
        } else {
          print('File is not recognized as an image');
        }
      } else {
        print('Failed to download image');
      }
    } catch (e) {
      print('Error downloading image: $e');
    }
  }

  Future<bool> validateImage(String filePath) async {
    final File file = File(filePath);
    final List<int> bytes = await file.readAsBytes();
    // Check the magic numbers/signatures for common image formats
    final List<int> jpgSignature = [0xFF, 0xD8];
    final List<int> pngSignature = [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A];
    // Validate if the file's signature matches any known image format
    if (bytes.length >= 2 && bytes[0] == jpgSignature[0] && bytes[1] == jpgSignature[1]) {
      return true; // JPG signature
    } else if (bytes.length >= 8 && ListEquality().equals(bytes.sublist(0, 8), pngSignature)) {
      return true; // PNG signature
    }
    return false; // Not recognized as an image
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titleText: 'Image Review',
        backgroundColor: ColorSelect.primaryColor,
        // You can customize other properties here if needed
      ),
      body: Padding(
        padding: EdgeInsets.all(4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: Center(
                  child: Container(
                    height: 40,
                    width: 40,
                    child: CircularProgressIndicator(
                        strokeWidth: 4, value: downloadProgress.progress),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: 8),
            // Text(
            //   image.altDescription ?? 'No description available',
            //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            // ),
            const SizedBox(height: 8),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(width: 8),
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
            child: const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.download, color: Colors.white),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
