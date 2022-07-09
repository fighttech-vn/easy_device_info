
# Easy Get Device Info
** Easy get Device Info Not need request any permission form user device.
- make sure setup `await DeviceInfoService().init()` 
- easy use with `DeviceInfoService.info`

Example:

```dart
await DeviceInfoService().init();
final countryCode = DeviceInfoService.info.countryCode ?? 'VN';
```
