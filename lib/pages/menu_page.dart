import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

//https://pub.dev/packages/settings_ui 참조!
//https://github.com/yako-dev/flutter-settings-ui 참조!

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Common'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                //단순클릭 항목
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                value: const Text('English'),
              ),
              SettingsTile.switchTile(
                //토글 선택 항목
                onToggle: (value) {},
                initialValue: true,
                leading: const Icon(Icons.format_paint),
                title: const Text('Enable custom theme'),
              ),
            ],
          ),
          SettingsSection(
            title: const Text('Account'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.email_outlined),
                title: const Text('E-mail'),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.logout),
                title: const Text('Sign out'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
