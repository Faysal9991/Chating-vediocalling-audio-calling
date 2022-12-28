// TODO Implement this library.

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vedio_call_audio_call/data/repository/language_repo.dart';
import 'package:vedio_call_audio_call/provider/audiocall_videocall_provider.dart';
import 'package:vedio_call_audio_call/provider/language_provider.dart';
import 'package:vedio_call_audio_call/provider/localization_provider.dart';
import 'package:vedio_call_audio_call/provider/nevigation_provider.dart';
import 'package:vedio_call_audio_call/provider/theme_provider.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Core

  // Repository
  sl.registerLazySingleton(() => LanguageRepo());


  // Provider
  sl.registerFactory(() => ThemeProvider(sharedPreferences: sl()));
  sl.registerFactory(() => NevigationProvider());
  sl.registerFactory(() => AudioVideoCallProvider());
  sl.registerFactory(() => LocalizationProvider(sharedPreferences: sl()));
  sl.registerFactory(() => LanguageProvider(languageRepo: sl()));


  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
}
