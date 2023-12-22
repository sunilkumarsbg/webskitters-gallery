import 'package:get/state_manager.dart';
import '../Model/model.dart';
import '../Services/remote_services.dart';

class ImageController extends GetxController {
  var isLoading = true.obs;
  var imagesList = RxList<PhotoModel>(); // Use RxList here

  @override
  void onInit() {
    fetchImage();
    super.onInit();
  }

  void fetchImage() async {
    try {
      isLoading(true);
      var images = await RemoteServices.fetchImages();
      if (images != null) {
        imagesList.assignAll(images); // Use assignAll to update the RxList
      }
    } finally {
      isLoading(false);
    }
  }
}