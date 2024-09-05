

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';


Future<void> launchWhatsapp() async {
  try {
    String number = "201222200056";
    String message = "اريد معرفة المزيد عن نيبو سيستم";
    String url = 'https://wa.me/$number?text=$message';

    final uri = Uri.encodeFull(url);

    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
    } else {
      throw 'Could not launch whatsapp ';
    }
  } catch (e) {
    if (kDebugMode) {
      print(e);
    }
  }
}