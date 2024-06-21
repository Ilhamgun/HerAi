import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:herai/app/controllers/auth_controller.dart';
import 'package:herai/app/data/data_source/shared_pref_secure_storage.dart';
import 'package:herai/app/data/entities/notif_data.dart';
import 'package:herai/app/data/network/herai_api.dart';
import 'package:herai/app/resource/string_const.dart';
import 'package:herai/app/utils/extensions.dart';
import 'package:herai/app/utils/log.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/translation.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  Log.info("background_message: ${message.messageId}");
  Log.info("background_message data: ${message.data}");
  SimpleNotificationData dataNotif =
      SimpleNotificationData.fromMap(message.data);

  switch (dataNotif.type) {
    case StringConst.notifTransaction:
      Log.info('background_message go to transcation');
      Get.toNamed(Routes.HISTORY_TRANSACTION_PAGE);
      break;
    default:
      Log.info('background_message default ${message.data['type']}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(Duration(seconds: 2));

  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );

  // await messaging.subscribeToTopic("/topics/flutter-notification");

  try {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    Log.info('User granted permission: ${settings.authorizationStatus}');

    await messaging.setForegroundNotificationPresentationOptions(
        alert: true, badge: true, sound: true);

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      Log.info('Got a message whilst in the foreground!');
      Log.info('Message data: ${message.data}');
      if (message.notification != null) {
        Log.info(
            'Message also contained a notification: ${message.notification}');
        Get.notifSnackbar(message.notification?.title ?? "Empty",
            message.notification?.body ?? "Empty");
      }

      SimpleNotificationData dataNotif =
          SimpleNotificationData.fromMap(message.data);

      switch (dataNotif.type) {
        case StringConst.notifTransaction:
          Log.info('background_message main go to transcation');
          Get.toNamed(Routes.HISTORY_TRANSACTION_PAGE);
          break;
        default:
          Log.info('background_message main default ${message.data['type']}');
      }
    });
  } catch (e) {
    Log.colorGreen("ERRORS" + e.toString());
  }

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ); // To turn off landscape mode
  int _onboarding = 0;
  try {
    _onboarding =
        await SharedPrefSecureStorage.getInstance()?.getPrefOnBoarding() ?? 0;
  } catch (e) {
    Log.colorGreen("ERRORS" + e.toString());
  }

  Log.colorGreen('OnBOARDING : $_onboarding');
  runApp(HerAiApp(_onboarding));
}

class HerAiApp extends StatelessWidget {
  final authController = Get.put(AuthController(), permanent: true);
  final api = Get.put(HerAiApi(), permanent: true);
  int _onboarding = 0;

  HerAiApp(this._onboarding);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranlation(),
      locale: Locale(authController.languange.value),
      //Locale('id'),
      title: "Application",
      initialRoute: //Routes.NOTIFICATION,
          _onboarding == 0
              ? Routes.ONBOARDING_PAGE
              : authController.authToken != ""
                  ? Routes.HOME_V2
                  : Routes.LOGIN_PAGE,
      getPages: AppPages.routes,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xff50C446),
        ),
        primarySwatch: Colors.green,
        primaryColor: Color(0xff50C446),
      ),
    );
  }
}
