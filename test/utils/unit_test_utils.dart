import 'dart:async';

import 'package:fake_async/fake_async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

typedef Stub<T> = T Function();

/// Test a function using stub
/// Common usage for repository testing
///
/// Example: Repository testing with stub
/// class WalletRepo {
///   Future<int> inquiryBalance() {
///       return httpClient.getWalletBalance();
///   }
/// }
///
/// testWithSingleStub(
///   'should call httpClient.getWalletBalance once',
///   on: () => repo.inquiryBalance(),
///   stub: () => httpClient.getWalletBalance(),
///   stubReturn: Future.value(10000), //dummy amount
/// );
///
/// Example: Repository testing with stub and value assertion
/// class WalletRepo {
///   Future<String> balanceToCurrency(int balance) async {
///       final format = await httpClient.getCurrencyFormat();
///       return NumberFormat(format).format(balance);
///   }
/// }
///
/// testWithSingleStub(
///   'should call httpClient.getCurrencyFormat() once
///   and return value should be formatted',
///   on: () => repo.balanceToCurrency(10000),
///   stub: () => httpClient.getCurrencyFormat(),
///   stubReturn: Future.value('IDR #,###'),
///   onReturn: (Future<String> value) {
///     expectLater(value, completion(equals('IDR 10,000')));
///   },
/// );
///
/// Example: Throwable assertion
/// class WalletRepo {
///   Future<int> parseBalance(String balance) async {
///       return NumberFormat('IDR #,###').parse(balance);
///   }
/// }
///
/// testWithSingleStub(
///   'should throw ParseException',
///   on: () => repo.parseBalance('ABC'),
///   onThrow: (error) {
///     expect(value, isInstanceOf<ParseException>());
///   },
/// );
///
///
///
void testWithSingleStub<T, R>(
  String description, {
  required R Function() on,
  Stub? stub,
  T? stubReturn,
  FutureOr Function(R)? onReturn,
  Function(dynamic)? onThrow,
  bool shouldSkipTest = false,
}) {
  final stubs = stub == null ? null : [stub];
  final stubReturns = stubReturn == null ? null : [stubReturn];
  testWithMultipleStub(
    description,
    on: on,
    stubs: stubs,
    stubReturns: stubReturns,
    onReturn: onReturn,
    onThrow: onThrow,
    shouldSkipTest: shouldSkipTest,
  );
}

/// Test a function using multiple stub
/// Common usage for repository testing
/// further explanation see @testWithSingleStub()
///
void testWithMultipleStub<T, R>(
  String description, {
  required R Function() on,
  List<Stub>? stubs,
  List<T>? stubReturns,
  FutureOr Function(R)? onReturn,
  Function(dynamic)? onThrow,
  bool shouldSkipTest = false,
}) {
  test(description, () async {
    if (stubs != null && stubReturns != null) {
      for (var i = 0; i < stubs.length; i++) {
        if (stubReturns[i] is Future) {
          when(stubs[i]).thenAnswer((invocation) => stubReturns[i]);
        } else if (stubReturns[i] is Exception) {
          when(stubs[i]).thenThrow(stubReturns[i] as Object);
        } else if (stubReturns[i] is Function) {
          when(stubs[i])
              .thenAnswer((invocation) => (stubReturns[i] as Function).call());
        } else {
          when(stubs[i]).thenReturn(stubReturns[i]);
        }
      }
    }

    try {
      final function = on();
      if (function is Future) {
        /// for future function we need to wait until complete
        /// otherwise the verify() will get unexpected value
        await function.whenComplete(() {});
      }

      await onReturn?.call(function);

      if (stubs != null) {
        int index = 0;
        for (final caller in stubs) {
          try {
            verify(caller);
          } catch (e) {
            debugPrint('verify stub index $index failed');
            rethrow;
          }

          index++;
        }
      }
    } catch (e) {
      if (onThrow == null) {
        rethrow;
      }
      onThrow.call(e);
    }
  }, skip: shouldSkipTest);
}

/// Run future and all the microtask
/// Useful for testing function that have unawaited future inside
T blockingFuture<T>(Future<T> Function() future) {
  T? result;
  dynamic resultError;
  StackTrace? resultStackTrace;

  fakeAsync((async) {
    future().then((value) {
      return result = value;
    }).onError((error, stackTrace) {
      resultError = error;
      resultStackTrace = stackTrace;
      throw error!;
    });

    // flush all the microtask and timer
    // make sure all unawaited future is completed
    async.flushTimers();
    async.flushMicrotasks();
  });

  if (resultError != null) {
    if (resultStackTrace != null) {
      Error.throwWithStackTrace(resultError, resultStackTrace!);
    }

    throw resultError!;
  }

  if (result is! T) {
    // Somehow when using mocktail, the future is not completed
    throw Exception('Result is null.\n If you put Future as a stub return,'
        'make sure you wrap it with function, Ex: () => Future.value(1)');
  }

  return result as T;
}
