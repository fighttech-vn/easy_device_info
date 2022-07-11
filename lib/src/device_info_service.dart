import 'package:country_codes/country_codes.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:universal_platform/universal_platform.dart';

import 'device_info_model.dart';

class DeviceInfoService {
  static late DeviceInfoModel _infoModel;
  static DeviceInfoModel info = _infoModel;

  Future<void> init() async {
    ///
    /// final Locale deviceLocale = CountryCodes.getDeviceLocale();
    /// print(deviceLocale.languageCode); // Displays en
    /// print(deviceLocale.countryCode); // Displays US
    ///
    await CountryCodes.init();
    final deviceLocale = CountryCodes.getDeviceLocale();

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
    String? model, os;

    if (UniversalPlatform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      model = androidInfo.model;
      os = androidInfo.version.baseOS;
    } else if (UniversalPlatform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      model = iosInfo.model;
      os = '${iosInfo.utsname.machine}${iosInfo.utsname.version}';
    }

    _infoModel = DeviceInfoModel(
      countryCode: deviceLocale?.countryCode,
      languageCode: deviceLocale?.languageCode,
      model: model,
      os: os,
    );
  }
}
