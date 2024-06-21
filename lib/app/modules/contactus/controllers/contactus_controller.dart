import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactusController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void openWhatsApp(String messageTo) async {
    String _url =
        "https://api.whatsapp.com/send?phone=$messageTo&text=Halo%20Kak!%0ASelamat%20datang%20di%20Layanan%20HerAi.%20Ada%20yang%20dapat%20kami%20bantu?%20%F0%9F%98%8A"; //url(messageTo, myName);

    await canLaunchUrl(Uri.parse(_url))
        ? await launchUrl(
            Uri.parse(_url),
            mode: LaunchMode.externalApplication,
          )
        : throw const FormatException("Invalid URL");
  }

  Future<void> openWeb(String url) async {
    await canLaunchUrl(Uri.parse(url))
        ? await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication,
          )
        : throw const FormatException("Invalid URL");
  }

  Future<void> sendEmail(String email, String subject, String body) async {
    String emailUrl =
        "mailto:$email?subject=${Uri.parse(subject)}&body=${Uri.parse(body)}";

    if (await canLaunchUrl(Uri.parse(emailUrl))) {
      await launchUrl(
        Uri.parse(emailUrl),
        mode: LaunchMode.externalApplication,
      );
    } else {
      throw "Error occured sending an email";
    }
    // await launchUrl(
    //   Uri.parse('https://mail.google.com/mail/u/0/#inbox'),
    //   mode: LaunchMode.externalApplication,
    // );
  }
}
