class StoreModel {
  String uid;
  String storeName;
  String location;
  String district;
  String email;
  String logo;
  String datetime;
  String printerMac;
  String status;

  StoreModel({
    required this.uid,
    required this.storeName,
    required this.email,
    required this.location,
    required this.district,
    required this.logo,
    required this.datetime,
    required this.printerMac,
    required this.status
  });
}