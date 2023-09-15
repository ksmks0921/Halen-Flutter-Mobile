// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:halen_customer_app/screens/welcome/welcome_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Widget maw(Widget home, {ogr}) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            home: home,
            onGenerateRoute: ogr,
          );
        });
  }

  testWidgets('Given screen is [WelcomeScreen] after [IntroSplashScreen] loads',
      (tester) async {
    await tester.pumpWidget(maw(const WelcomeScreen()));
    final loginBtn = find.byKey(const Key("login_btn_key"));
    final buttonText = find.byKey(const Key("welcome_signup"));

    expect(buttonText, findsNothing);
    expect(loginBtn, findsOneWidget);
  });
  // final loginBtn = find.byKey(const Key("login_btn_key"));
//TODO: Test sign up button onTap event, onTap => [SignUpScreen] screen
//   testWidgets('Given loginUp button is tapped navigate to [homeScreen]',
//       (tester) async {
//     await tester.pumpWidget(maw(
//       const HomeScreen(),
//       ogr: AppRouter.generateRoute,
//     ));

//     await tester.tap(loginBtn);
//     await tester.pumpAndSettle();

//     expect(find.byKey(const Key("home_scaffold_key")), findsOneWidget);
//     expect(find.byKey(const Key("signup_text")), findsNothing);
//   });
// }
}
