
import 'package:share_plus/share_plus.dart';

class SharePlugin {
  static void shareLink(String link, String exitus ) {
    Share.share( link, subject: exitus );
  }
}