import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'base_demo_messages_all.dart';

class BaseDemoLocalizations {
  static BaseDemoLocalizations? of(BuildContext context) {
    return Localizations.of<BaseDemoLocalizations>(context, BaseDemoLocalizations);
  }

  static Future<BaseDemoLocalizations> load(Locale locale) {
    final String name = locale.countryCode!.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return BaseDemoLocalizations();
    });
  }

  String get title => Intl.message(
        'hello',
        name: 'title',
        desc: 'demo localizations.',
      );

  String greet(String name) => Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone.',
        args: [name],
      );
}

class BaseDemoLocalizationsDelegate extends LocalizationsDelegate<BaseDemoLocalizations> {
  BaseDemoLocalizationsDelegate();

  @override
  Future<BaseDemoLocalizations> load(Locale locale) {
    return BaseDemoLocalizations.load(locale);
  }

  @override
  bool isSupported(Locale locale) {
    return true;
  }

  @override
  bool shouldReload(LocalizationsDelegate<BaseDemoLocalizations> old) {
    return false;
  }
}
