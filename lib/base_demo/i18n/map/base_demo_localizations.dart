import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';

class BaseDemoLocalizations {
  final Locale locale;

  BaseDemoLocalizations(this.locale);

  static BaseDemoLocalizations? of(BuildContext context) {
    return Localizations.of<BaseDemoLocalizations>(context, BaseDemoLocalizations);
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String? get title {
    return _localized[locale.languageCode]!['title'];
  }
}

class BaseDemoLocalizationsDelegate extends LocalizationsDelegate<BaseDemoLocalizations> {
  BaseDemoLocalizationsDelegate();

  @override
  Future<BaseDemoLocalizations> load(Locale locale) {
    return SynchronousFuture<BaseDemoLocalizations>(BaseDemoLocalizations(locale));
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
