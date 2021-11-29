import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class HttpException implements Exception {
  final String message;

  HttpException(this.message);
}


  void sendCrashLytics(error, String httpBody) {    
    if (FirebaseCrashlytics.instance.isCrashlyticsCollectionEnabled) {
      FirebaseCrashlytics.instance.recordError(error, null);
      FirebaseCrashlytics.instance.setCustomKey('exception', error.toString());
      FirebaseCrashlytics.instance.setCustomKey('statusCode', error.statusCode);
      FirebaseCrashlytics.instance.setCustomKey('httpBody', httpBody);
    }
  }

