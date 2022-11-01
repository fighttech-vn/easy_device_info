import 'package:country_codes/country_codes.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';

import 'device_info_model.dart';

class DeviceInfoService {
  static late DeviceInfoModel _infoModel;
  static DeviceInfoModel info = _infoModel;

  Future<void> init() async {
    ///
    /// DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    /// AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    /// print('Running on ${androidInfo.model}'); // e.g. "Moto G (4)"
    /// IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    /// print('Running on ${iosInfo.utsname.machine}'); // e.g. "iPod7,1"
    /// WebBrowserInfo webBrowserInfo = await deviceInfo.webBrowserInfo;
    /// print(
    /// 'Running on ${webBrowserInfo.userAgent}'); // e.g. "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:61.0) Gecko/20100101 Firefox/61.0"
    ///

    final deviceInfo = DeviceInfoPlugin();
    String? model, os, countryCode, languageCode, id;
    if (UniversalPlatform.isAndroid || UniversalPlatform.isIOS) {
      ///
      /// final Locale deviceLocale = CountryCodes.getDeviceLocale();
      /// print(deviceLocale.languageCode); // Displays en
      /// print(deviceLocale.countryCode); // Displays US
      ///
      await CountryCodes.init();
      final deviceLocale = CountryCodes.getDeviceLocale();
      countryCode = deviceLocale?.countryCode;
      languageCode = deviceLocale?.languageCode;
    }

    if (UniversalPlatform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;

      os = androidInfo.version.baseOS;
      id = androidInfo.id;
    } else if (UniversalPlatform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      model = iosInfo.model;

      os = '${iosInfo.utsname.machine}${iosInfo.utsname.version}';
      id = iosInfo.identifierForVendor;
    }

    // package_info_plus
    final packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;

    _infoModel = DeviceInfoModel(
      countryCode: countryCode,
      languageCode: languageCode,
      model: model,
      os: os,
      appName: appName,
      packageName: packageName,
      version: version,
      buildNumber: buildNumber,
      id: id,
    );
  }
}
