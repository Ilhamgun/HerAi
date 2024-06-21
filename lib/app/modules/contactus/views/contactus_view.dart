import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/contactus_controller.dart';

class ContactusView extends GetView<ContactusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings_hubungi_kami'.tr),
        centerTitle: true,
        elevation: 0,
        leadingWidth: 60,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Color(0xfB50C346),
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Container(
              height: 90,
              width: 155,
              margin: EdgeInsets.symmetric(vertical: 25),
              child: Image.asset('assets/images/HerAi_title.png',
                  fit: BoxFit.contain),
            ),
            SizedBox(
              height: 20,
            ),
            _linkContact(
                'assets/icons/whatsapp.png',
                'Whatsapp',
                '+62 853-8571-8739',
                () => controller.openWhatsApp('6285385718739')),
            _linkContact(
              'assets/icons/instagram.png',
              'Instagram',
              '@appherai',
              () => controller.openWeb('https://www.instagram.com/appherai/'),
            ),
            _linkContact(
                'assets/icons/linkedin.png',
                'LinkedIn',
                'HerAi Application',
                () => controller.openWeb(
                    'https://www.linkedin.com/search/results/all/?keywords=HerAi%20App&origin=GLOBAL_SEARCH_HEADER&sid=Doc')),
            _linkContact(
                'assets/icons/email.png',
                'Email',
                'appherai@gmail.com',
                () => controller.sendEmail(
                      'appherai@gmail.com',
                      '',
                      '',
                    )),
            _linkContact('assets/icons/web.png', 'Website', 'www.appherai.com',
                () => controller.openWeb('https://www.appherai.com')),
          ]),
        ),
      ),
    );
  }

  Widget _linkContact(
      String icon, String title, String link, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset(icon, fit: BoxFit.contain),
            ),
            SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
                SizedBox(height: 4),
                Text(
                  link,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Spacer(),
            // Icon(Icons.chevron_right)
            Image.asset('assets/images/next.png'),
            // CircleAvatar(
            //   backgroundImage: AssetImage('assets/images/next.png'),
            //   backgroundColor: Color(0xffD9D9D9),
            //   minRadius: 28,
            // )
          ],
        ),
      ),
    );
  }
}
