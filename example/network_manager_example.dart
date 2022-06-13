// ignore_for_file: avoid_print
import 'package:network_manager/network_manager.dart';

Future<void> main() async {
  final manager = NetworkManager(InternetConnectionChecker());

  if (await manager.isConnected) {
    someAsyncFunction();
  }
}

void someAsyncFunction() => print('Connected!');
