import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_simplee/controllers/controller.dart';
import 'package:grow_simplee/screens/add_details.dart';
import 'package:grow_simplee/screens/rider_details.dart';
import 'package:grow_simplee/widgets/dismissible_widget.dart';

class RidersList extends StatelessWidget {
  RidersList({super.key});

  final controller = Get.find<RiderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Riders List',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return controller.allRiders.isEmpty
                    ? const Text(
                        'No Riders Presnt Now. \nPress the Add button below to add Riders.')
                    : Expanded(
                        child: ListView.builder(
                            itemCount: controller.allRiders.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                child: DismissibleWidget(
                                  item: controller.allRiders[index],
                                  onDismissed: (direction) {
                                    switch (direction) {
                                      case DismissDirection.endToStart:
                                        controller.rejectRider(
                                            controller.allRiders[index]);
                                        break;
                                      case DismissDirection.startToEnd:
                                        controller.approveRider(
                                            controller.allRiders[index]);
                                        break;
                                      default:
                                        break;
                                    }
                                  },
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RiderDetails(
                                                      riderModel: controller
                                                          .allRiders[index])));
                                    },
                                    leading: ClipOval(
                                      child: Image.file(
                                        File(controller.allRiders[index].photo),
                                        fit: BoxFit.cover,
                                        height: 55,
                                        width: 55,
                                      ),
                                    ),
                                    title: Text(
                                      controller.allRiders[index].name,
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                      );
              }),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddDetails()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 80,
                    alignment: Alignment.center,
                    child: const Text(
                      'Add',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
