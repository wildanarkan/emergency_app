import 'package:emergency_app/data/app_network.dart';
import 'package:emergency_app/data/app_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../utils/unit_test_utils.dart';

class MockAppNetwork extends Mock implements AppNetwork {}

void main() {
  final appNetwork = MockAppNetwork();
  late AppRepository repo;

  setUp(() {
    repo = AppRepository(appNetwork);
  });

  group('Login app', () {
    testWithMultipleStub(
      'Login Success',
      on: () => repo.login(
        email: 'coba@main.com',
        password: '1234',
      ),
      stubs: [
        () => appNetwork.login(
              email: 'coba@main.com',
              password: '1234',
            ),
      ],
      stubReturns: [
        Future.value('Success'),
      ],
      onReturn: (value) {
        expectLater(
          value,
          completion('Success'),
        );
      },
    );

    testWithMultipleStub(
      'Login Failed',
      on: () => repo.login(
        email: 'coba@main.com',
        password: '12344',
      ),
      stubs: [
        () => appNetwork.login(
              email: 'coba@main.com',
              password: '12344',
            ),
      ],
      stubReturns: [
        Future.value('Failed'),
      ],
      onReturn: (value) {
        expectLater(
          value,
          completion('Failed'),
        );
      },
    );
  });
}
