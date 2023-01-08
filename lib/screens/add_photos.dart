import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_simplee/controllers/controller.dart';
import 'package:grow_simplee/screens/riders_list.dart';
import 'package:grow_simplee/screens/view_photos.dart';

class AddPhotos extends StatelessWidget {
  AddPhotos({super.key});

  final controller = Get.find<RiderController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            return Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add Documents',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                              value: controller.aadharImage.isNotEmpty,
                              onChanged: ((value) {}))),
                          const Text('Aadhar'),
                        ],
                      ),
                      Row(children: [
                        Obx(() => TextButton(
                            onPressed: () {
                              if (controller.aadharImage.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPhotos(
                                          document: controller.aadharImage)),
                                );
                              }
                            },
                            child: (Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.aadharImage.isNotEmpty
                                            ? Colors.blue
                                            : Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      color: controller.aadharImage.isNotEmpty
                                          ? Colors.blue
                                          : Colors.grey),
                                ))))),
                        TextButton(
                            onPressed: () => controller.pickImage('Aadhar'),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text('Add')))
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                              value: controller.panCardImage.isNotEmpty,
                              onChanged: ((value) {}))),
                          const Text('Pan Card'),
                        ],
                      ),
                      Row(children: [
                        Obx(() => TextButton(
                            onPressed: () {
                              if (controller.panCardImage.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPhotos(
                                          document: controller.panCardImage)),
                                );
                              }
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color:
                                            controller.panCardImage.isNotEmpty
                                                ? Colors.blue
                                                : Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      color: controller.panCardImage.isNotEmpty
                                          ? Colors.blue
                                          : Colors.grey),
                                )))),
                        TextButton(
                            onPressed: () => controller.pickImage('Pan Card'),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text('Add')))
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                              value: controller.dlImage.isNotEmpty,
                              onChanged: ((value) {}))),
                          const Text('Driving License'),
                        ],
                      ),
                      Row(children: [
                        Obx(() => TextButton(
                            onPressed: () {
                              if (controller.dlImage.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPhotos(
                                          document: controller.dlImage)),
                                );
                              }
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.dlImage.isNotEmpty
                                            ? Colors.blue
                                            : Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                      color: controller.dlImage.isNotEmpty
                                          ? Colors.blue
                                          : Colors.grey),
                                )))),
                        TextButton(
                            onPressed: () =>
                                controller.pickImage('Driving License'),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text('Add')))
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                              value: controller.bankChequeImage.isNotEmpty,
                              onChanged: ((value) {}))),
                          const Text('Bank Cheque'),
                        ],
                      ),
                      Row(children: [
                        Obx(() => TextButton(
                            onPressed: () {
                              if (controller.bankChequeImage.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPhotos(
                                          document:
                                              controller.bankChequeImage)),
                                );
                              }
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller
                                                .bankChequeImage.isNotEmpty
                                            ? Colors.blue
                                            : Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('View',
                                    style: TextStyle(
                                        color: controller
                                                .bankChequeImage.isNotEmpty
                                            ? Colors.blue
                                            : Colors.grey))))),
                        TextButton(
                            onPressed: () =>
                                controller.pickImage('Bank Cheque'),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text('Add')))
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Obx(() => Checkbox(
                              value: controller.riderImage.isNotEmpty,
                              onChanged: ((value) {}))),
                          const Text('Photo'),
                        ],
                      ),
                      Row(children: [
                        Obx(() => TextButton(
                            onPressed: () {
                              if (controller.riderImage.isNotEmpty) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ViewPhotos(
                                          document: controller.riderImage)),
                                );
                              }
                            },
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: controller.riderImage.isNotEmpty
                                            ? Colors.blue
                                            : Colors.grey),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text('View',
                                    style: TextStyle(
                                        color: controller.riderImage.isNotEmpty
                                            ? Colors.blue
                                            : Colors.grey))))),
                        TextButton(
                            onPressed: () => controller.pickImage('Photo'),
                            child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 7),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text('Add')))
                      ]),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ]),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: (() {
                  if (controller.aadharImage.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text('Please Upload Aadhar')),
                    );
                  } else if (controller.panCardImage.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text('Please Upload Pan Card')),
                    );
                  } else if (controller.dlImage.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text('Please Upload Driving License')),
                    );
                  } else if (controller.bankChequeImage.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text('Please Upload Bank Cheque')),
                    );
                  } else if (controller.riderImage.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          duration: Duration(milliseconds: 500),
                          content: Text('Please Upload your Photo')),
                    );
                  } else {
                    controller.addRiders();
                    controller.clearControllers();
                    Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) => RidersList()),(Route<dynamic> route) => false);
                  }
                }),
                child: Container(
                  height: 50,
                  width: 80,
                  alignment: Alignment.center,
                  child: const Text(
                    'Save',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
