// ignore_for_file: lines_longer_than_80_chars

import 'package:easy_device_info/easy_device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                  Text(
                      'packageName: \t\t${DeviceInfoService.info?.packageName}'),
                  Text('version: \t\t${DeviceInfoService.info?.version}'),
                  Text('appVersion: \t\t${DeviceInfoService.info?.appVersion}'),
                  const Divider(),
                  Text(
                      'countryCode: \t\t${DeviceInfoService.info?.countryCode}'),
                  Text('locale: \t\t${DeviceInfoService.info?.locale}'),
                  Text('languages: \t\t${DeviceInfoService.info?.languages}'),
                  const Divider(),
                  Text('os: \t\t${DeviceInfoService.info?.os}'),
                  Text(
                      'deviceOsVersion: \t\t${DeviceInfoService.info?.deviceOsVersion}'),
                  Text('model: \t\t${DeviceInfoService.info?.model}'),
                  const Divider(),
                  Text('id: \t\t${DeviceInfoService.info?.id}'),
                  Text('identifier: \t\t${DeviceInfoService.info?.identifier}'),
                  const Divider(),
                  Text('deviceName: \t\t${DeviceInfoService.info?.deviceName}'),
                  Text(
                    'deviceOsVersion:${DeviceInfoService.info?.deviceOsVersion}',
                  ),
                  GestureDetector(
                    onTap: () {
                      copyTextSnackBar(
                          DeviceInfoService.info?.data.toString() ?? '',
                          context: context);
                    },
                    child: Text(
                      'raw data: ${DeviceInfoService.info?.data}',
                    ),
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

void copyTextSnackBar(String? text, {BuildContext? context}) {
  Clipboard.setData(ClipboardData(text: text ?? '')).then((value) {
    if (context != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Copied'),
          duration: Duration(seconds: 2),
          behavior:
              SnackBarBehavior.floating, // Makes it look more like a toast
        ),
      );
    }
  });
}
