import 'package:gutenberg_library/core/network/network_info.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkInfoImpl extends NetworkInfo {

  final InternetConnectionChecker connectionChecker;
  
  NetworkInfoImpl({required this.connectionChecker});

  @override
  Future<bool> get isConnected async => await connectionChecker.hasConnection;
}
