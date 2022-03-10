import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class Apple {
  Future<dynamic> getAppleToken() async {
    final credential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    print("authorizationCode: ${credential.authorizationCode}");
    print("identityToken: ${credential.identityToken}");
    return credential.authorizationCode;
  }
}
