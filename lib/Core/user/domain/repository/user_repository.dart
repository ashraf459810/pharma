

abstract class UserRepository {
  
  Future<bool> getIsVerify();
  Future<String> getToken();
  Future<void> setIsVerify(bool value);
  Future<void> setToken(String token);
}
