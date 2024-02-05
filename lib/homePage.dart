import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:photo/Controller/orderController.dart';
import 'package:photo/resource/color.dart';
import 'package:photo/resource/function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final OrderController orderlistController = Get.put(OrderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          titleText: 'Orderlist',
          backgroundColor: ColorSelect.primaryColor,
        ),
        body: Obx(() {
          if (orderlistController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            print("res${orderlistController.orderList.length}");
            return ListView.builder(
                itemCount: orderlistController.orderList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(orderlistController.orderList[index].orderId, style: TextStyle(fontSize: 12,color: Colors.black),),
                      subtitle: Text("${orderlistController.orderList[index].omsErrorDescription} - Price: \$${orderlistController.orderList[index].price} - Status: ${orderlistController.orderList[index].orderStatus}"),
                    ),
                  );
                },
              );

            //   StaggeredGridView.countBuilder(
            //   crossAxisCount: 2,
            //   itemCount: orderlistController.orderList.length,
            //   crossAxisSpacing: 16,
            //   mainAxisSpacing: 16,
            //   itemBuilder: (context, index) {
            //     return OrdersTile(orderlistController.orderList[index]);
            //   },
            //   staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
            // );
          }
        }));
  }
}
