import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/hive/boxes.dart';

import '../hive/settings.dart';
import '../providers/settings_provider.dart';
import '../widgets/settings_tile.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 20.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ValueListenableBuilder<Box<Settings>>(
                    valueListenable: Boxes.getSettings().listenable(),
                    builder: (context, box, child) {
                      if (box.isEmpty) {
                        return SettingsTile(
                            icon: Icons.light_mode,
                            title: 'Theme',
                            value: false,
                            onChanged: (value) {
                              final settingProvider =
                                  context.read<SettingsProvider>();
                              settingProvider.toggleDarkMode(
                                value: value,
                              );
                            });
                      } else {
                        final settings = box.getAt(0);
                        return SettingsTile(
                            icon: settings!.isDarkTheme
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            title: 'Theme',
                            value: settings.isDarkTheme,
                            onChanged: (value) {
                              final settingProvider =
                                  context.read<SettingsProvider>();
                              settingProvider.toggleDarkMode(
                                value: value,
                              );
                            });
                      }
                    })
              ],
            ),
          ),
        ));
  }
}
