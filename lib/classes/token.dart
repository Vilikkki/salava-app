class Token {
  String accessToken;
  String refreshToken;
  String tokenType;
  int expiresIn;

  Token({this.accessToken, this.refreshToken, this.tokenType, this.expiresIn});

  factory Token.fromJson(Map<String, dynamic> json) => new Token(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      tokenType: json['token_type'],
      expiresIn: json['expires_in']);

  String get tokenAccess {
    return accessToken;
  }

  String get tokenRefresh {
    return refreshToken;
  }

  String get type {
    return tokenType;
  }

  int get expiry {
    return expiresIn;
  }

  String accessAndRefreshWithType() {
    return '$type $tokenAccess,$tokenRefresh';
  }
}
