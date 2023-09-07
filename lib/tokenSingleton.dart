class TokenSingleton {
  static final TokenSingleton _singleton = TokenSingleton._internal();

  String token = '';
  final String contentType = "application/x-www-form-urlencoded";
  final String grantType = "client_credentials";
  final String clientID = '4235bc5a42284e6eae31fff9d2bd4399';
  final String clientSecret = '67504c5887ec4a9eacf0e32680f48270';

  factory TokenSingleton() {
    return _singleton;
  }

  TokenSingleton._internal();
}
