import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'memory_management.dart';
import 'utils.dart';

class FirebaseUtils {
  static FirebaseMessaging messaging = FirebaseMessaging.instance;
  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static String? fcmtoken;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);

  static Future<void> initialised() async {
    await Firebase.initializeApp();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    fcmtoken = await messaging.getToken();
    "Firebase token is : $fcmtoken".printinfo;
    MemoryManagement.setGCMToken(gcmToken: fcmtoken!);

    FirebaseMessaging.onBackgroundMessage((RemoteMessage message) async {
      print("Handling a background message: ${message.notification!.body}");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      "${notification!.title} onMessage".printinfo;
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      print('A new onMessageOpenedApp event was published!');
      //await Get.to(Search());
      "${message.notification!.body} message on click ".printinfo;
    });

    /* Enable crashlytics here */
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }

  static sendAnalyticsEvent(String loginUser) async {
    await analytics.logEvent(
      name: 'Login Event',
      parameters: <String, dynamic>{
        'app': 'District Leads',
        'login': 'Success',
        'loginUser': loginUser
      },
    );

    "User logged $loginUser".printwtf;
  }

  static recordError(dynamic e, dynamic stacktrace) {
    FirebaseCrashlytics.instance.recordError(e, stacktrace);
    "error reported".printerror;
  }

  static recordCustomCrash(dynamic key, dynamic value) {
    FirebaseCrashlytics.instance.log("Login Error : $value");
    FirebaseCrashlytics.instance.setCustomKey(key, value);
    "error reported".printerror;
  }

  static Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('A new _firebaseMessagingBackgroundHandler event was published!');
    message.notification!.title!.printinfo;
  }
}
