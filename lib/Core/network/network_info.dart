
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInf {
  final String baseUrl = 'https://pharmaserv.bitsblend.org/api/V1';
  Future<bool> get isConnected;
}

class NetworkInfImpl implements NetworkInf {
  final String baseurl = 'https://pharmaserv.bitsblend.org/api/V1';


  InternetConnectionChecker connectionChecker = InternetConnectionChecker();

  NetworkInfImpl([
    this.connectionChecker,
  ]);

  @override
  Future<bool> get isConnected async =>
      await InternetConnectionChecker().hasConnection;

  @override
  String get baseUrl => baseurl.toString();
}
