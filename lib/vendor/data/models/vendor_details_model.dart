import 'package:json_annotation/json_annotation.dart';
part 'vendor_details_model.g.dart';

@JsonSerializable()
class VendorDetailsModel {
  final String businessName;
  final String emailAddress;
  final int phoneNumber;
  final String country;
  final String state;
  final String city;
  bool isApproved;

  final bool isTaxRegistered;
  final String storeImage;

  VendorDetailsModel(
      {required this.businessName,
      required this.emailAddress,
      required this.phoneNumber,
      required this.storeImage,
      required this.country,
      required this.state,
      required this.city,
      required this.isApproved,
      required this.isTaxRegistered});
  factory VendorDetailsModel.fromJson(Map<String, dynamic> data) =>
      _$VendorDetailsModelFromJson(data);

  Map<String, dynamic> toJson() => _$VendorDetailsModelToJson(this);
}
