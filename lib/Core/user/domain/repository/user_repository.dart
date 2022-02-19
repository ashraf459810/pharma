

abstract class UserRepository {
  
  Future<bool> getIsVerify();
  Future<String> getToken();
  Future<void> setIsVerify(String value);
  Future<void> setToken(String token);
}
