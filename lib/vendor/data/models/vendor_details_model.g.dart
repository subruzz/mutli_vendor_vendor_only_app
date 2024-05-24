// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorDetailsModel _$VendorDetailsModelFromJson(Map<String, dynamic> json) =>
    VendorDetailsModel(
      businessName: json['businessName'] as String,
      emailAddress: json['emailAddress'] as String,
      phoneNumber: (json['phoneNumber'] as num).toInt(),
      storeImage: json['storeImage'] as String,
      country: json['country'] as String,
      state: json['state'] as String,
      city: json['city'] as String,
      isApproved: json['isApproved'] as bool,
      isTaxRegistered: json['isTaxRegistered'] as bool,
    );

Map<String, dynamic> _$VendorDetailsModelToJson(VendorDetailsModel instance) =>
    <String, dynamic>{
      'businessName': instance.businessName,
      'emailAddress': instance.emailAddress,
      'phoneNumber': instance.phoneNumber,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'isApproved': instance.isApproved,
      'isTaxRegistered': instance.isTaxRegistered,
      'storeImage': instance.storeImage,
    };
