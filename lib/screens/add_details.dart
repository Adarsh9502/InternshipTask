import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grow_simplee/controllers/controller.dart';
import 'package:grow_simplee/screens/add_photos.dart';
import 'package:grow_simplee/widgets/multiselect_dropdown.dart';

class AddDetails extends StatelessWidget {
  AddDetails({super.key});

  final List<String> localitiesList = [
    'HIG Colony',
    'MCD Colony',
    'Basanti Colony',
    'JP Chowk'
  ];

  final _formKey = GlobalKey<FormState>();

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
            controller.clearControllers();
            return Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add Riders Details',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 16),
                  )),
              TextFormField(
                controller: controller.nameController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) =>
                    (value != null && value.isNotEmpty) ? null : 'Enter name',
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(fontSize: 16),
                  )),
              TextFormField(
                controller: controller.phoneController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.length != 9) {
                    return 'Enter a 9 digit Phone Number';
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Enter your Phone Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Localities',
                    style: TextStyle(fontSize: 16),
                  )),
              CustomMultiselectDropDown(
                listOFStrings: localitiesList,
                selectedList: controller.selectedList,
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Current Address',
                    style: TextStyle(fontSize: 16),
                  )),
              TextFormField(
                controller: controller.addressController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => (value != null && value.isNotEmpty)
                    ? null
                    : 'Enter current address',
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Enter the current address',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Pincode',
                    style: TextStyle(fontSize: 16),
                  )),
              TextFormField(
                controller: controller.pincodeController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.length != 6) {
                    return 'Enter a 6 digit Pincode';
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Enter your Pincode',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'Bank Account Number',
                    style: TextStyle(fontSize: 16),
                  )),
              TextFormField(
                controller: controller.bankAccountController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => (value != null && value.isNotEmpty)
                    ? null
                    : 'Enter Bank Account Number',
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Enter your Bank Account Number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 15,
              ),
              const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    'IFSC Code',
                    style: TextStyle(fontSize: 16),
                  )),
              TextFormField(
                controller: controller.ifscController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) => (value != null && value.isNotEmpty)
                    ? null
                    : 'Enter IFSC Code',
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    hintText: 'Enter the IFSC Code',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: (() {
                    if (_formKey.currentState!.validate()) {
                      if (controller.sList.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPhotos()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Select atleast 1 locality')),
                        );
                      }
                    }
                  }),
                  child: Container(
                    height: 50,
                    width: 80,
                    alignment: Alignment.center,
                    child: const Text(
                      'Next',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
