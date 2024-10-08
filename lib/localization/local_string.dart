import 'package:get/get.dart';

///https://docs.oracle.com/cd/E13214_01/wli/docs92/xref/xqisocodes.html

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "hello": "Hello",
          "selectLanguage": "Select language",
        },
        "vi_VN": {
          "hello": "Xin chào",
          "selectLanguage": "Lựa chọn ngôn ngữ",
        },
      };
}
