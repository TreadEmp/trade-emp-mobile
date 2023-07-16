import 'package:google_sign_in/google_sign_in.dart';

class GoogleService {
  final _googleSignIn = GoogleSignIn();

  Future<GoogleSignInAccount?> login() => _googleSignIn.signIn();
}
