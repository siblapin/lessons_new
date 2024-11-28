import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants/constants.dart';

class SettingsScreens extends StatelessWidget {
  const SettingsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final langs = context.supportedLocales;
    return Scaffold(
      appBar: AppBar(title: Text("settings".tr())),
      body: Column(
        children: [
          ListTile(
              title: Text("Go back to Home Page".tr()),
              onTap: () => context.go("/")),
          ListTile(
            title: Text("Language".tr()),
            trailing: FilledButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text("Select Language:".tr()),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: List.generate(langs.length, (index) {
                                final lang = langs[index].toString();

                                return ListTile(
                                  title: Text(langsMap[lang]?.tr() ?? "error"),
                                  onTap: () {
                                    context
                                      ..setLocale(langs[index])
                                      ..pop()
                                      ..go("/");
                                  },
                                );
                              }),
                            ));
                      });
                },
                child: Text(langsMap[context.locale.toString()] ?? "error")),
          )
        ],
      ),
    );
  }
}
