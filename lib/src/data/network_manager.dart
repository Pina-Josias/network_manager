import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:network_manager/src/domain/inetwork_manager.dart';

///Implementation of NetworkManager
class NetworkManager implements INetworkManager {
  ///NetworkManager recive a connection Checker
  NetworkManager(this.connectionChecker);

  /// Access to connectionChecker properties
  final InternetConnectionChecker connectionChecker;

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}
