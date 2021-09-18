import 'package:shared_preferences/shared_preferences.dart';

const String currentTransactionKey = "current_transaction";
const String accessToken = "access_token";
const String themeKey = "current_theme";
const String languageCode = 'languageCode';

class LocalSource {
  static SharedPreferences? _preferences;

  LocalSource._();

  static LocalSource? localSource;

  static LocalSource instance = LocalSource._();

  static Future<LocalSource> getInstance() async {
    if (localSource == null) {
      localSource = LocalSource._();
      await localSource!._init();
    }
    print(localSource!.getToken());
    print(localSource!.getCompanyId());
    return localSource!;
  }

  static Future<SharedPreferences> getSharedPreferences() async {
    if (_preferences == null) {
      localSource = LocalSource._();
      await localSource!._init();
    }
    return _preferences!;
  }

  Future<void> _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setUser({
    required String lastName,
    required String firstName,
    required String companyName,
    required String subDomain,
    required String token,
    required String refreshToken,
    required String companyId,
    required String currentShopId,
    required String currentShopName,
    required String userId,
    required String imageUrl,
  }) async {
    if (_preferences != null) {
      await _preferences!.setString('last_name', lastName);
      await _preferences!.setString('first_name', firstName);
      await _preferences!.setString('company_name', companyName);
      await _preferences!.setString('sub_domain', subDomain);
      await _preferences!.setString('access_token', token);
      await _preferences!.setString('refresh_token', refreshToken);
      await _preferences!.setString('company_id', companyId);
      await _preferences!.setString('current_shop_id', currentShopId);
      await _preferences!.setString('current_shop_name', currentShopName);
      await _preferences!.setString('user_id', userId);
      await _preferences!.setString('image_url', imageUrl);
    }
  }

  String getCompanyId() {
    return _preferences?.getString('company_id') ?? '';
  }

  String getCurrentShopId() {
    return _preferences?.getString('current_shop_id') ?? '';
  }

  String getCurrentShopName() {
    return _preferences?.getString('current_shop_name') ?? '';
  }

  Future<void> setCurrentShopId(String value) async {
    await _preferences?.setString('current_shop_id', value);
  }

  String getSubDomain() {
    return _preferences?.getString('sub_domain') ?? '';
  }

  String getCompanyName() {
    return _preferences?.getString('company_name') ?? '';
  }

  String getFullName() {
    return (_preferences?.getString('first_name') ?? '') +
        ' ' +
        (_preferences?.getString('last_name') ?? '');
  }

  String getUserId() {
    return _preferences?.getString('user_id') ?? '';
  }

  String getTheme() {
    return _preferences?.getString(themeKey) ?? '';
  }

  Future<void> setTheme(String theme) async {
    await _preferences!.setString(themeKey, theme);
  }

  String getToken() {
    return _preferences?.getString('access_token') ?? '';
  }

  String getLocale() {
    return _preferences?.getString(languageCode) ?? 'ru';
  }

  Future<void> setLocale(String lang) async {
    await _preferences?.setString(languageCode, lang);
  }

  Future<void> clear() async {
    await _preferences!.clear();
  }
}
