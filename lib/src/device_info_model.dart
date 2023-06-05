class DeviceInfoModel {
  /// locale
  final List<dynamic>? languages;
  final String? locale;

  ///
  final String? countryCode;
  final String? languageCode;

  final String? model;
  final String? os;

  // package info
  final String? appName;
  final String? packageName;
  final String? version;
  final String? buildNumber;

  final String? id;
  final int? androidSdkInt;

  DeviceInfoModel({
    this.languages,
    this.locale,
    this.countryCode,
    this.languageCode,
    this.model,
    this.os,
    this.appName,
    this.packageName,
    this.version,
    this.buildNumber,
    this.id,
    this.androidSdkInt,
  });
}

extension DeviceInfoModelExt on DeviceInfoModel {
  String get appVersion => '$version ($buildNumber)';
}
