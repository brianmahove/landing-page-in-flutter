import 'package:flutter_test/flutter_test.dart';
import 'package:landing_page/helpers/Strings.dart';
import 'package:landing_page/main.dart'; // Import your main.dart file

void main() {
  testWidgets('SignUpScreen is shown when user is not a first-time user', (
    WidgetTester tester,
  ) async {
    // Simulate the case where the user is not using the app for the first time.
    final isFirstTime = false;

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(isFirstTime: isFirstTime));

    // Verify that the SignUpScreen is displayed.
    expect(
      find.text('Sign Up'),
      findsOneWidget,
    ); // Verify that the SignUp screen is loaded
  });

  testWidgets('Introduction screens are shown when user is a first-time user', (
    WidgetTester tester,
  ) async {
    // Simulate the case where the user is using the app for the first time.
    final isFirstTime = true;

    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(isFirstTime: isFirstTime));

    // Verify that introduction screen content is displayed.
    expect(
      find.text(Strings.stepOneTitle),
      findsOneWidget,
    ); // Example check for step one title
  });
}
