import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:grow_simplee/model/rider_model.dart';
import 'package:image_picker/image_picker.dart';

class RiderController extends GetxController {
  var allRiders = <RiderModel>[].obs;
  List<String> sList = <String>[].obs;
  var approvedRiders = <RiderModel>[].obs;
  var rejectedRiders = <RiderModel>[].obs;

  final RxInt _currentIndex = 0.obs;
  int get currentIndex => _currentIndex.value;
  set currentIndex(int v) => _currentIndex.value = v;

  final Rx<String> _aadharImage = ''.obs;
  String get aadharImage => _aadharImage.value;
  set aadharImage(String v) => _aadharImage.value = v;

  final Rx<String> _panCardImage = ''.obs;
  String get panCardImage => _panCardImage.value;
  set panCardImage(String v) => _panCardImage.value = v;

  final Rx<String> _dlImage = ''.obs;
  String get dlImage => _dlImage.value;
  set dlImage(String v) => _dlImage.value = v;

  final Rx<String> _bankChequeImage = ''.obs;
  String get bankChequeImage => _bankChequeImage.value;
  set bankChequeImage(String v) => _bankChequeImage.value = v;

  final Rx<String> _riderImage = ''.obs;
  String get riderImage => _riderImage.value;
  set riderImage(String v) => _riderImage.value = v;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController bankAccountController = TextEditingController();
  TextEditingController ifscController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    pincodeController.dispose();
    bankAccountController.dispose();
    ifscController.dispose();
    super.dispose();
  }

  void selectedList(List<String> listOFSelectedItem) {
    sList = listOFSelectedItem;
  }

  void clearControllers() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
    pincodeController.clear();
    bankAccountController.clear();
    ifscController.clear();
    _aadharImage.value = '';
    _panCardImage.value = '';
    _dlImage.value = '';
    _bankChequeImage.value = '';
    _riderImage.value = '';
  }

  void addRiders() {
    allRiders.add(RiderModel(
        name: nameController.text,
        phoneNumber: phoneController.text,
        localities: sList,
        currentAddress: addressController.text,
        pinCode: pincodeController.text,
        bankAccountNumber: bankAccountController.text,
        ifscCode: ifscController.text,
        aadhar: aadharImage,
        panCard: panCardImage,
        dl: dlImage,
        bankCheque: bankChequeImage,
        photo: riderImage));
  }

  void approveRider(RiderModel riderModel) {
    approvedRiders.add(riderModel);
    allRiders.remove(riderModel);
  }

  void rejectRider(RiderModel riderModel) {
    rejectedRiders.add(riderModel);
    allRiders.remove(riderModel);
  }

  Future pickImage(String documentName) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      switch (documentName) {
        case 'Aadhar':
          aadharImage = image.path;
          break;
        case 'Pan Card':
          panCardImage = image.path;
          break;
        case 'Driving License':
          dlImage = image.path;
          break;
        case 'Bank Cheque':
          bankChequeImage = image.path;
          break;
        case 'Photo':
          riderImage = image.path;
          break;
      }
    } on PlatformException catch (e) {
      debugPrint('Failed to pick Image: $e');
    }
  }
}
