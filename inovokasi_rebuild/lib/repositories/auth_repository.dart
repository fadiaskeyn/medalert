class AuthRepository {
  Future<bool> authenticate(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return email == 'admin@gmail.com' && password == 'admin123';
  }
}
