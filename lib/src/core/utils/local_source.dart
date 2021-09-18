import 'package:shared_preferences/shared_preferences.dart';

const String accessToken = 'access_token';
const String subdomain = 'subdomain';

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
    required String subdomain,
    required String token,
  }) async {
    if (_preferences != null) {
      await _preferences!.setString('sub_domain', subdomain);
      await _preferences!.setString('access_token', token);
    }
  }

  String getSubdomain() {
    return _preferences?.getString('sub_domain') ?? '';
  }

  String getToken() {
    return _preferences?.getString('access_token') ?? '';
  }

  Future<void> clear() async {
    await _preferences!.clear();
  }
}
