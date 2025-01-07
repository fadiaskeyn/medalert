//project/lib/cubit/auth_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:medalert/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthCubit() : super(AuthInitial());

  Future<void> signInWithGoogle() async {
    try {
      emit(AuthLoading());

      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        emit(const AuthError('Google sign in was cancelled'));
        return;
      }

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      final User? user = userCredential.user;
      if (user == null) {
        emit(const AuthError('Failed to sign in with Google'));
        return;
      }

      emit(AuthSuccess(
        userId: user.uid,
        email: user.email,
        displayName: user.displayName,
      ));
    } on FirebaseAuthException catch (e) {
      emit(AuthError(e.message ?? 'An error occurred during Google sign in'));
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    try {
      emit(AuthLoading());
      await Future.wait([
        _auth.signOut(),
        _googleSignIn.signOut(),
      ]);
      emit(AuthInitial());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  // Check if user is already signed in
  Future<void> checkAuthStatus() async {
    final User? currentUser = _auth.currentUser;
    if (currentUser != null) {
      emit(AuthSuccess(
        userId: currentUser.uid,
        email: currentUser.email,
        displayName: currentUser.displayName,
      ));
    } else {
      emit(AuthInitial());
    }
  }
}
