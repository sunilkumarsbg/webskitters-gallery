import 'package:flutter/material.dart';
import 'package:photo/Model/model.dart';
import 'package:photo/imageDetails.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImagesTile extends StatelessWidget {
  final PhotoModel imagesList;
  const ImagesTile(this.imagesList);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ImageDetailPage(
                    image: imagesList.urls.full,
                  )),
        );
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: imagesList.urls.full,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: Container(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                              strokeWidth: 2, value: downloadProgress.progress),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                imagesList.altDescription,
                maxLines: 2,
                style: TextStyle(
                    fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              Padding(
                  padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.orangeAccent.withOpacity(0.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:16),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.visibility,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:8),
                              child: Text("View Image",   style: TextStyle(color: Colors.white,fontSize: 13),),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
