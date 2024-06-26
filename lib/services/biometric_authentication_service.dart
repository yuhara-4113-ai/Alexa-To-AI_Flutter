import 'package:local_auth/local_auth.dart';
import 'package:logger/logger.dart';

final log = Logger();

class BiometricAuthenticationService {
  // インスタンスをシングルトンにする
  BiometricAuthenticationService._privateConstructor();
  static final _instance = BiometricAuthenticationService._privateConstructor();
  factory BiometricAuthenticationService() {
    return _instance;
  }

  // 端末の生体認証を使えるようにするパッケージのインスタンス
  final LocalAuthentication localAuthentication = LocalAuthentication();

  Future<bool> auth() async {
    try {
      return await localAuthentication.authenticate(
        localizedReason: '生体認証でログインしてください',
        options: const AuthenticationOptions(
          // 生体認証以外のローカル認証はしない
          useErrorDialogs: true,
          // システムによってアプリがバックグラウンドになってもプラグイン側が認証失敗を返さないようにする
          // 認証時に電話や他のアプリを開いた状態から、再度認証画面に戻ってきた際に認証を再試行する
          stickyAuth: true,
        ),
      );
    } catch (e) {
      log.e(e.toString());
      return false;
    }
  }
}
