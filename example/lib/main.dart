import 'package:easy_device_info/easy_device_info.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'easy_device_info'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<void>(
        future: DeviceInfoService().init(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const SizedBox();
          }

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text('locale: \t\t${DeviceInfoService.info.locale}'),
                  Text('languages: \t\t${DeviceInfoService.info.languages}'),
                  const Divider(),
                  Text(
                      'countryCode: \t\t${DeviceInfoService.info.countryCode}'),
                  const Divider(),
                  Text('os: \t\t${DeviceInfoService.info.os}'),
                  Text('model: \t\t${DeviceInfoService.info.model}'),
                  const Divider(),
                  Text('appVersion: \t\t${DeviceInfoService.info.appVersion}'),
                  Text('id: \t\t${DeviceInfoService.info.id}'),
                  Text('identifier: \t\t${DeviceInfoService.info.identifier}'),
                  const Divider(),
                  Text('deviceName: \t\t${DeviceInfoService.info.deviceName}'),
                  Text(
                    'deviceOsVersion:${DeviceInfoService.info.deviceOsVersion}',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
