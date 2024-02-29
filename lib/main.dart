import 'package:camera/camera.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:secure_app/controllers/camera_controller.dart';
import 'package:secure_app/controllers/user_controller.dart';
import 'package:secure_app/ressources/app_colors.dart';
import 'package:secure_app/screens/login_screen/login_screen.dart';
import 'package:secure_app/screens/login_screen/login_with_only_password_screen.dart';
import 'package:secure_app/screens/main_screen/main_screen.dart';
import 'package:secure_app/screens/main_screen/screens/loader_screen/loader_screen.dart';
import 'package:secure_app/screens/on_board/onboard_screen.dart';
import 'package:secure_app/screens/personnal_info_screen/personnal_info_Screen.dart';
import 'package:secure_app/screens/register_screen/register_screen.dart';
import 'package:secure_app/screens/responses_screens/transaction_success.dart';
import 'package:secure_app/screens/splash_screen/splash_screen.dart';
import 'package:secure_app/screens/top_nav_bar/top_nav_bar.dart';
import 'package:secure_app/screens/verification_screen/validate_code_screen.dart';
import 'package:secure_app/screens/verification_screen/verification_screen.dart';
import 'package:gleap_sdk/gleap_sdk.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // OneSignal.Debug.setAlertLevel(OSLogLevel.none);
  OneSignal.initialize("7981a227-9341-42a5-b0f0-a9ac04099b33");
  final CameraControler cameraControler = Get.put(CameraControler());
  // Obtain a list of the available cameras on the device.
  cameraControler.cameras.value = await availableCameras(); // .onInit();
  print(cameraControler.cameras);
  OneSignal.Notifications.requestPermission(true);

  Gleap.registerPushMessageGroup(callbackHandler: (String topic) {
    FirebaseMessaging.instance.subscribeToTopic(topic);
  });

  Gleap.unregisterPushMessageGroup(callbackHandler: (String topic) {
    FirebaseMessaging.instance.unsubscribeFromTopic(topic);
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      // initialBinding: BindingsBuilder(() {
      //   Get.lazyPut(() => CameraControler());
      // }),
      supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
      // home: TransactionSuccessScreen(),
      home: const SplashScreen(),
    );
  }
}
