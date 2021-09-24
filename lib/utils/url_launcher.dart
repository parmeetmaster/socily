import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'logs.dart';

class UrlLaunchUtils {
  static launchCall(String phno) async {
    await canLaunch("tel://${phno}")
        ? await launch("tel://${phno}")
        : "Unable to call on number $phno".printerror;
  }

  static launchMail(String email) async {
    await canLaunch("mailto://${email}")
        ? await launch("mailto://${email}")
        : "Unable to mail on id $email".printerror;
  }

  static launchsocial({String? subject, String? message}) {
    Share.share(message ?? "", subject: subject ?? "");
  }
}
