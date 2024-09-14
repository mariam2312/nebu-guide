import 'package:url_launcher/url_launcher.dart';

Future<void> launchWhatsapp() async {
  try {
    // Define the phone number and message
    String number = "+201222200056";
    String message = "اريد معرفة المزيد عن نيبو سيستم";

    // URL encode the message
    String encodedMessage = Uri.encodeComponent(message);

    // Construct the URL
    String url = 'https://wa.me/$number?text=$encodedMessage';
    print('Launching URL: $url');

    // Check if the URL can be launched
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch WhatsApp';
    }
  } catch (e, s) {
    print('Error: $e');
  }
}
