import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:package_info_plus/package_info_plus.dart';

class UseFuturePage extends HookWidget {
  const UseFuturePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get PacageInfo with cached.
    final packageInfo = useMemoized(PackageInfo.fromPlatform);
    // Get information from future to async value.
    final snapshot = useFuture(packageInfo);

    final textStyleHL6 = Theme.of(context).textTheme.headline6;
    return Scaffold(
      appBar: AppBar(
        title: const Text('useFuture Sample'),
      ),
      body: Center(
        child: (() {
          if (snapshot.hasData) {
            return Text(
              'appName:${snapshot.data!.appName}',
              style: textStyleHL6,
            );
          } else {
            return Text(
              'AppName unavailable.',
              style: textStyleHL6,
            );
          }
        })(),
      ),
    );
  }
}

class StateModel {
  int countValue = 0;
}
