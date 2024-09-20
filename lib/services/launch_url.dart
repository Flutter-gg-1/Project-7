import 'package:url_launcher/url_launcher.dart';

void launchLink(String url) async {
    if (url.startsWith('http://') || url.startsWith('https://')) {
      final Uri uri = Uri.parse(url);

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw Exception('Could not launch $url');
      }
    } else {
      throw Exception('Invalid URL: $url');
    }
  }