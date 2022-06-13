import 'package:mocktail/mocktail.dart';
import 'package:network_manager/network_manager.dart';
import 'package:test/test.dart';

class MockDataConnectionChecker extends Mock
    implements InternetConnectionChecker {}

void main() {
  late NetworkManager networkInfo;
  late MockDataConnectionChecker dataConnectionChecker;

  setUp(() {
    dataConnectionChecker = MockDataConnectionChecker();
    networkInfo = NetworkManager(dataConnectionChecker);
  });

  group('isConnected', () {
    test(
      'forward the call to DataConnectionChecker.hasConnection',
      () async {
        // setup -> create the object to test
        final tIsConnected = Future.value(true);

        when(
          () => dataConnectionChecker.hasConnection,
        ).thenAnswer((_) => tIsConnected);

        // side effects -> collect the result to test
        final result = networkInfo.isConnected;

        // expectations -> compare result to expected value
        verify(() => dataConnectionChecker.hasConnection);
        expect(result, tIsConnected);
      },
    );
  });
}
