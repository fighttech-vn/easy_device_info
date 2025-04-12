import 'package:flutter/foundation.dart';

@immutable
class DeviceInfoModel {
  /// locale
  final List<dynamic>? languages;
  final String? locale;

  ///
  final String? countryCode;
  final String? languageCode;

  final String? model;
  final String? os;
  final String? platform;

  // package info
  final String? appName;
  final String? packageName;
  final String? version;
  final String? buildNumber;

  final String? id;
  final int? androidSdkInt;
  final String? identifier;

  final String? deviceName;
  final String? deviceOsVersion;

  const DeviceInfoModel({
    this.languages,
    this.locale,
    this.countryCode,
    this.languageCode,
    this.model,
    this.os,
    this.platform,
    this.appName,
    this.packageName,
    this.version,
    this.buildNumber,
    this.id,
    this.androidSdkInt,
    this.identifier,
    this.deviceName,
    this.deviceOsVersion,
  });

  Map<String, dynamic> toJson() {
    final device = this;
    return {
      'id': device.id,
      'model': device.model,
      'os': device.os,
      'platform': device.platform,
      'appName': device.appName,
      'packageName': device.packageName,
      'version': device.version,
      'buildNumber': device.buildNumber,
      'androidSdkInt': device.androidSdkInt,
      'identifier': device.identifier,
      'deviceName': device.deviceName,
      'deviceOsVersion': device.deviceOsVersion,
      'countryCode': device.countryCode,
      'languageCode': device.languageCode,
    };
  }
}

extension DeviceInfoModelExt on DeviceInfoModel {
  String get appVersion => '$version ($buildNumber)';
}
