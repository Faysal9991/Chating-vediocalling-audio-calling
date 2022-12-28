

import 'package:vedio_call_audio_call/data/model/language_model.dart';
import 'package:vedio_call_audio_call/util/app_constant.dart';

class LanguageRepo {
  List<LanguageModel> getAllLanguages() {
    return AppConstant.languagesList;
  }
}
