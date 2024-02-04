import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pet_adoption_app/presentation/screens/details.dart';
import 'package:pet_adoption_app/presentation/screens/home.dart';

void main() {
  testWidgets('HomeScreen widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(
      home: HomeScreen(),
    ));

    // Verify that the text "Find your\nfavorite pet" is present.
    expect(find.text("Find your\nfavorite pet"), findsOneWidget);

    // Enter some text into the search field and trigger a frame.
    await tester.enterText(find.byType(TextField), 'Search term');
    await tester.pump();

    // Verify that the entered text is present.
    expect(find.text('Search term'), findsOneWidget);

    // Tap on the first item in the list.
    await tester.tap(find.byType(GestureDetector).first);
    await tester.pump();

    // Verify that the DetailsScreen widget is pushed onto the navigation stack.
    expect(find.byType(DetailsScreen), findsOneWidget);
  });
}
