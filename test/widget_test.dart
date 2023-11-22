import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/main.dart';
import 'package:restaurant/provider/restaurant_provider.dart';
import 'package:restaurant/ui/home.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  setUpAll(() {
    /// Initialize FFI
    sqfliteFfiInit();
    /// Change the default factory
    databaseFactory = databaseFactoryFfi;
  });
  testWidgets('Home screen should display city selection and restaurant list', (WidgetTester tester) async {
    await tester.pumpWidget(
        const MyApp()
    );
    await tester.pumpAndSettle();
    await tester.pumpWidget(
      ChangeNotifierProvider<RestaurantProvider>(
        create: (_) => RestaurantProvider(),
        child: MaterialApp(
          home: Home(),
        ),
      ),
    );

  });
}