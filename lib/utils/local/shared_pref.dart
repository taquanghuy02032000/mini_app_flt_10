import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const _PREF_TOKEN_KEY = 'pref_token_key';
  static const _PREF_LANGUAGE = 'pref_language';
  static const _PREF_REFRESH_TOKEN = 'pref_refresh_token';
  static const _PREF_LOGIN_USERNAME = 'pref_login_username';
  static const _PREF_LOGIN_PASSWORD = 'pref_login_password';
  static const _PREF_NAME = 'pref_name';
  static const _PREF_AVATAR = 'pref_avatar';
  static const _PREF_EXEMPLE = 'pref_exemple';
  static const _PREF_NAME_SCREEN = 'pref_name_screen';
  static const _PREF_STATUS_QUICK_LOGIN = 'pref_quick_login';
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static Future<bool> saveLoginUserName(String userName) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_LOGIN_USERNAME, userName);
  }

  static String getEmailUser() {
    return _prefsInstance?.getString(_PREF_LOGIN_USERNAME) ?? '';
  }

  static Future<void> clearEmailUser() async {
    await _prefsInstance?.remove(_PREF_LOGIN_USERNAME);
  }

  static Future<bool> savePasswordUser(String password) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_LOGIN_PASSWORD, password);
  }

  static Future<bool> saveStatusQuickLogin(bool status) async {
    final prefs = await _instance;
    return prefs.setBool(_PREF_STATUS_QUICK_LOGIN, status);
  }

  static bool getStatusQuickLogin() {
    return _prefsInstance?.getBool(_PREF_STATUS_QUICK_LOGIN) ?? false;
  }

  static String getPasswordUser() {
    return _prefsInstance?.getString(_PREF_LOGIN_PASSWORD) ?? '';
  }

  static Future<bool> saveAvatar(String password) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_AVATAR, password);
  }

  static String getAvatar() {
    return _prefsInstance?.getString(_PREF_AVATAR) ?? '';
  }

  static bool isGuest() {
    return getToken().isEmpty;
  }

  static bool isLoggedIn() {
    return getToken().isNotEmpty;
  }

  static Future<bool> saveToken(String value) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_TOKEN_KEY, value);
  }

  static String getToken() {
    return _prefsInstance?.getString(_PREF_TOKEN_KEY) ?? '';
  }

  static String getNameUser() {
    return _prefsInstance?.getString(_PREF_NAME) ?? '';
  }

  static Future<bool> saveLanguage(String code) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_LANGUAGE, code);
  }

  static Future<bool> saveNameUser(String code) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_NAME, code);
  }

  static Future<bool> saveRefreshToken(String token) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_REFRESH_TOKEN, token);
  }

  static Future<void> clearAuthData() async {
    await _prefsInstance?.remove(_PREF_TOKEN_KEY);
    await _prefsInstance?.remove(_PREF_AVATAR);
  }

  static Future<bool> saveExample({required bool exampled}) async {
    final prefs = await _instance;
    return prefs.setBool(_PREF_EXEMPLE, exampled);
  }

  static bool getsaveExampled() {
    return _prefsInstance?.getBool(_PREF_EXEMPLE) ?? false;
  }

  static Future<bool> saveNameScreen({required String screenName}) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_NAME_SCREEN, screenName);
  }

  static String getUserNameSameGmail() {
    final email = PrefsService.getEmailUser();

    if (email.isEmpty) {
      return 'defaultAcount';
    }
    if (email.contains('@')) {
      return email.substring(0, email.indexOf('@'));
    }
    return '';
  }

  static Future<void> clearNameScreen() async {
    /// reset name screen to direct
    await _prefsInstance?.remove(_PREF_NAME_SCREEN);
  }

  static Future<void> clearData() async {
    await _prefsInstance?.clear();
    return;
  }
}
