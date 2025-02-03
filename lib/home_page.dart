import 'package:flutter/material.dart';
import 'package:flutter_local_example/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appLocalizations = AppLocalizations.of(context);
    if (appLocalizations == null) {
      debugPrint('AppLocalizations is null!');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter localizations'),
      ),
      drawer: const Drawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.translate('hello'),
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              AppLocalizations.of(context)!.translate('welcome'),
              // 'Welcome'.tr(context),
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
