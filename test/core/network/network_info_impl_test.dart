import 'package:flutter_test/flutter_test.dart';
import 'package:gutenberg_library/core/network/network_info_impl.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mocktail/mocktail.dart';

class MockConnectionChecker extends Mock implements InternetConnectionChecker {}

void main() {

  InternetConnectionChecker connectionChecker = MockConnectionChecker(); 

  NetworkInfoImpl networkInfo = NetworkInfoImpl(connectionChecker: connectionChecker);

  test('should forward the call to InternetConnectionChecker', () async {
    // arrange
    when(() => connectionChecker.hasConnection).thenAnswer((_) async => true);
    // act
    final result = await networkInfo.isConnected;
    // assert
    verify(() => connectionChecker.hasConnection);
    expect(result, true);
  });  
}
