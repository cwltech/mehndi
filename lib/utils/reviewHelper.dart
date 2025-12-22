import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class ReviewHelper {
  static final InAppReview _inAppReview = InAppReview.instance;

  static Future<void> requestReview() async {
    try {
      if (await _inAppReview.isAvailable()) {
        await _inAppReview.requestReview();
      } else {
        // fallback to store link
        //await _openStoreListing();
        await _inAppReview.openStoreListing(
          appStoreId: 'com.catalougeapp.app', // Android package name
        );
      }
    } catch (e) {
      await _openStoreListing();
    }
  }

  static Future<void> _openStoreListing() async {
    final Uri url = Uri.parse(
      "https://play.google.com/store/apps/details?id=com.catalougeapp.app",
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
