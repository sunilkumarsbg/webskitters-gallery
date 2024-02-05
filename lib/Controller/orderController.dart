// import 'package:get/state_manager.dart';
// import '../Model/model.dart';
// import '../Services/remote_services.dart';
//
// class OrderController extends GetxController {
//   var isLoading = true.obs;
//   var orderList = RxList<OrderListModel>(); // Use RxList here
//
//   @override
//   void onInit() {
//     fetchOrder();
//     super.onInit();
//   }
//
//   void fetchOrder() async {
//     try {
//       isLoading(true);
//       var list = await RemoteServices.fetchOrders();
//       if (list != null) {
//         orderList.assignAll(list); // Use assignAll to update the RxList
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
// }

import 'package:get/get.dart';
import '../Model/model.dart';
import '../Services/remote_services.dart';

class OrderController extends GetxController {
  var isLoading = true.obs;
  var orderList = <OrderListModel>[].obs;
  var error;

  @override
  void onInit() {
    fetchOrders();
    super.onInit();
  }

  void fetchOrders() async {
    try {
      isLoading(true);
      var orders = await RemoteServices.fetchOrders();

      if (orders != null) {
        orderList.assignAll(orders);
      } else {
        error = 'Failed to fetch orders';
      }
    } finally {
      isLoading(false);
    }
  }
}
