import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_simplee/controllers/controller.dart';
import 'package:grow_simplee/model/rider_model.dart';

class RiderDetails extends StatelessWidget {
  final RiderModel riderModel;
  RiderDetails({super.key, required this.riderModel});

  final PageController pageController = PageController();

  final controller = Get.find<RiderController>();

  final List<String> documents = [
    'Aadhar',
    'Pan Card',
    'Driving License',
    'Bank Cheque',
    'Photo'
  ];

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
          'Rider Details',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Obx(
              () => IconButton(
                onPressed: () {
                  pageController.previousPage(
                      curve: Curves.easeIn,
                      duration: const Duration(milliseconds: 200));
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color:
                      controller.currentIndex <= 0 ? Colors.grey : Colors.black,
                ),
              ),
            ),
            Container(
                height: 280,
                width: 280,
                color: const Color(0xFFCACACA),
                child: PageView(
                  onPageChanged: (value) {
                    controller.currentIndex = value;
                  },
                  controller: pageController,
                  children: [
                    Image.file(
                      File(riderModel.aadhar),
                      fit: BoxFit.cover,
                    ),
                    Image.file(
                      File(riderModel.panCard),
                      fit: BoxFit.cover,
                    ),
                    Image.file(
                      File(riderModel.dl),
                      fit: BoxFit.cover,
                    ),
                    Image.file(
                      File(riderModel.bankCheque),
                      fit: BoxFit.cover,
                    ),
                    Image.file(
                      File(riderModel.photo),
                      fit: BoxFit.cover,
                    ),
                  ],
                )),
            Obx(() => IconButton(
                  onPressed: () {
                    pageController.nextPage(
                        curve: Curves.easeIn,
                        duration: const Duration(milliseconds: 200));
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: controller.currentIndex >= 4
                        ? Colors.grey
                        : Colors.black,
                  ),
                ))
          ]),
          const SizedBox(
            height: 20,
          ),
          Align(
              alignment: Alignment.center,
              child: Obx(
                () => (Text(documents[controller.currentIndex],
                    style:
                        const TextStyle(fontSize: 18, color: Colors.black87))),
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text.rich(
              TextSpan(text: 'Name:   ', children: <TextSpan>[
                TextSpan(
                    text: riderModel.name,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700))
              ]),
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text.rich(
              TextSpan(text: 'Phone Number:   ', children: <TextSpan>[
                TextSpan(
                    text: riderModel.phoneNumber,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700))
              ]),
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text.rich(
              TextSpan(text: 'Address:    ', children: <TextSpan>[
                TextSpan(
                    text: riderModel.currentAddress,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700))
              ]),
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            child: Text(
              'Localities:',
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              riderModel.localities.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.rejectRider(riderModel);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: const Text(
                      'Reject',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    controller.approveRider(riderModel);
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: const Text(
                      'Approve',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
