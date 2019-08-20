import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class OBPLocalizations {
  OBPLocalizations(this.locale);

  final Locale locale;

  static OBPLocalizations of(BuildContext context) {
    return Localizations.of<OBPLocalizations>(context, OBPLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'badge': 'badge',
      'settings': 'settings',
    },
    'fi': {
      'badge': 'merkki',
      'settings': 'asetukset',
    },
    'sv': {
      'badge': 'märke',
      'settings': 'inställningar',
    },
    'fr': {
      'badge': 'badge',
      'settings': 'paramètres',
    },
  };

  String get badge {
    return _localizedValues[locale.languageCode]['badge'];
  }
}

//////////////////////////////////////////////////////////////////////////////

class OBPLocalizationsDelegate extends LocalizationsDelegate<OBPLocalizations> {
  const OBPLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en'].contains(locale.languageCode);

  @override
  Future<OBPLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<OBPLocalizations>(OBPLocalizations(locale));
  }

  @override
  bool shouldReload(OBPLocalizationsDelegate old) => false;
}
