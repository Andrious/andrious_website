import 'package:andrious/src/view.dart'
    show L10n, Locale, arSA, esAR, frFR, hiIN, koKP, ptPT, zhCN;

//ignore: non_constant_identifier_names
final AppTrs = AppLocalizations();

class AppLocalizations extends L10n {
  factory AppLocalizations() => _this ??= AppLocalizations._();
  AppLocalizations._();
  static AppLocalizations? _this;

  /// The app's default Locale
  @override
  Locale get textLocale => const Locale('en', 'CA');

  /// The app's translations.
  @override
  Map<Locale, Map<String, String>> get l10nMap => {
        // const Locale('ar', 'SA'): arSA,
        // const Locale('hi', 'IN'): hiIN,
        // const Locale('es', 'AR'): esAR,
        // const Locale('fr', 'FR'): frFR,
        // const Locale('pt', 'PT'): ptPT,
        // const Locale('ko', 'KP'): koKP,
        // const Locale('zh', 'CN'): zhCN,
      };
}
