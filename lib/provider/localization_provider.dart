
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vedio_call_audio_call/util/app_constant.dart';

class LocalizationProvider extends ChangeNotifier {
  final SharedPreferences sharedPreferences;

  LocalizationProvider({required this.sharedPreferences}) {
    _loadCurrentLanguage();
  }

  Locale _locale = const Locale('en', 'US');
  bool _isLtr = true;

  Locale get locale => _locale;

  bool get isLtr => _isLtr;

  void setLanguage(Locale locale, int index) {
    _locale = locale;
    if (_locale.languageCode == 'ar') {
      _isLtr = false;
    } else {
      _isLtr = true;
    }
    _saveLanguage(_locale, index);
    notifyListeners();
  }

  _loadCurrentLanguage() async {
    _locale =
        Locale(sharedPreferences.getString(AppConstant.languageCode) ?? 'en', sharedPreferences.getString(AppConstant.countryCode) ?? 'US');
    _isLtr = _locale.languageCode == 'ar';
    notifyListeners();
  }

  _saveLanguage(Locale locale, int index) async {
    sharedPreferences.setString(AppConstant.languageCode, locale.languageCode);
    sharedPreferences.setString(AppConstant.countryCode, locale.countryCode ?? '');
    sharedPreferences.setInt(AppConstant.selectLanguageIndex, index);
    getSelectLanguageIndexValue();
    notifyListeners();
  }

  int getSelectLanguageIndexValue() {
    return sharedPreferences.getInt(AppConstant.selectLanguageIndex) ?? 0;
  }
}
