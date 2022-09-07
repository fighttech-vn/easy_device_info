class DeviceInfoModel {
  final String? countryCode;
  final String? languageCode;

  final String? model;
  final String? os;

  // package info
  final String? appName;
  final String? packageName;
  final String? version;
  final String? buildNumber;

  DeviceInfoModel({
    this.countryCode,
    this.languageCode,
    this.model,
    this.os,
    this.appName,
    this.packageName,
    this.version,
    this.buildNumber,
  });
}

extension DeviceInfoModelExt on DeviceInfoModel {
  String get appVersion => '$version ($buildNumber)';
}
