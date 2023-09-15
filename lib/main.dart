import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halen_customer_app/constants/colors.dart';
import 'package:halen_customer_app/routes/router.dart';
import 'package:halen_customer_app/screens/welcome/welcome_screen.dart';
import 'package:halen_customer_app/configuration/dev_startup_config.dart';
import 'package:halen_customer_app/configuration/flags/feature_flags.dart';
import 'package:device_preview_minus/device_preview_minus.dart';
import 'package:halen_customer_app/widgets/custom_error_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:halen_customer_app/utils/halen_services_wrap.dart';
import 'package:halen_customer_app/styles/page_transitions_builder.dart';

// void configLoading() {
//   EasyLoading.instance
//     ..displayDuration = const Duration(milliseconds: 2000)
//     ..indicatorType = EasyLoadingIndicatorType.fadingCircle
//     ..loadingStyle = EasyLoadingStyle.dark
//     ..indicatorSize = 45.0
//     ..radius = 10.0
//     ..progressColor = Colors.yellow
//     ..backgroundColor = Colors.green
//     ..indicatorColor = Colors.yellow
//     ..textColor = Colors.yellow
//     ..maskColor = Colors.blue.withOpacity(0.5)
//     ..userInteractions = true

//     ..dismissOnTap = false;
// }

void main() {
  runApp(DevicePreview(
      enabled: enableDevicePreviewPackage,
      builder: (context) => const ProviderScope(child: MyApp())));
  // configLoading();
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
            if (kReleaseMode) {
              return this;
            } else {
              return CustomError(errorDetails: errorDetails);
            }
          };
          EasyLoading.init();
          return MaterialApp(
            builder:
                enableDevicePreviewPackage ? DevicePreview.appBuilder : null,
            debugShowCheckedModeBanner: false,
            title: 'Halen Customer',
            // initialRoute: splash,
            onGenerateRoute: AppRouter.generateRoute,
            // You can use the library anywhere in the app even in theme
            theme: ThemeData(
              platform: TargetPlatform.iOS,
              pageTransitionsTheme: removeTransitions(),
              primaryColor: AppColors.primaryColor,
              colorScheme:
                  ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
              textTheme: Typography.englishLike2018.apply(
                  fontSizeFactor: 1.sp,
                  displayColor: Colors.black,
                  bodyColor: Colors.black),
            ),

            home: child,
          );
        },
        child: Builder(builder: (context) {
          initRunCtr += 1;
          if (startAtPageFlag && (initRunCtr == 2)) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              startAtPage(context);
            });
          }
          return const HalenServicesWrap(child: WelcomeScreen());
        }));
  }
}
