class RiderModel {
  RiderModel(
      {required this.name,
      required this.phoneNumber,
      required this.localities,
      required this.currentAddress,
      required this.pinCode,
      required this.bankAccountNumber,
      required this.ifscCode,
      required this.aadhar,
      required this.panCard,
      required this.dl,
      required this.bankCheque,
      required this.photo});
  String name;
  String phoneNumber;
  List<String> localities;
  String currentAddress;
  String pinCode;
  String bankAccountNumber;
  String ifscCode;
  String aadhar;
  String panCard;
  String dl;
  String bankCheque;
  String photo;
}
