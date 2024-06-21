import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:herai/app/resource/colors_data.dart';

import '../controllers/f_a_q_page_controller.dart';

class FAQPageView extends GetView<FAQPageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Syarat dan Ketentuan'),
        centerTitle: true,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ColorsCustom.primaryColor.green,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => controller.isfaq.isFalse
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  child: Column(
                    children: [
                      _qna(
                          q: 'Kebijakan Privasi',
                          a: 'Halaman ini digunakan untuk memberi tahu pengunjung mengenai kebijakan kami dengan pengumpulan, penggunaan, dan pengungkapan Informasi Pribadi jika ada yang memutuskan untuk menggunakan Layanan kami. Jika Anda memilih untuk meng)gunakan Layanan kami, maka Anda menyetujui pengumpulan dan penggunaan informasi sehubungan dengan kebijakan ini. Informasi Pribadi yang kami kumpulkan digunakan untuk menyediakan dan meningkatkan Layanan. Kami tidak akan menggunakan atau membagikan informasi Anda dengan siapa pun kecuali sebagaimana dijelaskan dalam Kebijakan Privasi ini. Istilah yang digunakan dalam Kebijakan Privasi ini memiliki arti yang sama seperti dalam Syarat dan Ketentuan kami, yang dapat diakses di HerAi kecuali ditentukan lain dalam Kebijakan Privasi ini.'),
                      _qna(
                          q: 'Pengumpulan dan Penggunaan Informasi',
                          a: 'Untuk pengalaman yang lebih baik, saat menggunakan Layanan kami, kami mungkin meminta Anda untuk memberikan kami informasi pengenal pribadi tertentu, termasuk namun tidak terbatas pada Kamera, Gambar, Alamat, Nomor Telepon, Nama, Email. Informasi yang kami minta akan disimpan oleh kami dan digunakan seperti yang dijelaskan dalam kebijakan privasi ini Aplikasi ini menggunakan layanan pihak ketiga yang dapat mengumpulkan informasi yang digunakan untuk mengidentifikasi Anda Tautan ke kebijakan privasi penyedia layanan pihak ketiga yang digunakan oleh aplikasi \n• Layanan Google Play \n• Data Log Kami ingin memberitahu Anda bahwa setiap kali Anda menggunakan Layanan kami, jika terjadi kesalahan dalam aplikasi, kami mengumpulkan data dan informasi (melalui produk pihak ketiga) di ponsel Anda yang disebut Data Log. Data Log ini dapat mencakup informasi seperti alamat Protokol Internet ("IP") perangkat Anda, nama perangkat, versi sistem operasi, konfigurasi aplikasi saat menggunakan Layanan kami, waktu dan tanggal penggunaan Layanan oleh Anda, dan statistik lainnya.'),
                      _qna(
                          q: 'Cookie',
                          a: 'Cookie adalah file dengan sejumlah kecil data yang biasanya digunakan sebagai pengenal unik anonim. Ini dikirim ke browser Anda dari situs web yang Anda kunjungi dan disimpan di memori internal perangkat Anda. Layanan ini tidak menggunakan "cookies" ini secara eksplisit. Namun, aplikasi dapat menggunakan kode dan perpustakaan pihak ketiga yang menggunakan "cookies" untuk mengumpulkan informasi dan meningkatkan layanan mereka. Anda memiliki pilihan untuk menerima atau menolak cookie ini dan mengetahui kapan cookie dikirim ke perangkat Anda. Jika Anda memilih untuk menolak cookie kami, Anda mungkin tidak dapat menggunakan beberapa bagian dari Layanan ini.'),
                      _qna(
                          q: 'Penyedia Layanan',
                          a: 'Kami dapat mempekerjakan perusahaan dan individu pihak ketiga karena alasan berikut:\n• Untuk memfasilitasi Layanan kami\n• Untuk menyediakan Layanan atas nama kami\n• Untuk melakukan layanan terkait Layanan\n• Untuk membantu kami dalam menganalisis bagaimana Layanan kami digunakan. Kami ingin memberitahu pengguna Layanan ini bahwa pihak ketiga ini memiliki akses ke Informasi Pribadi Anda. Alasannya adalah untuk melakukan tugas yang diberikan kepada mereka atas nama kita. Namun, mereka berkewajiban untuk tidak mengungkapkan atau menggunakan informasi tersebut untuk tujuan lain.'),
                      _qna(
                          q: 'Keamanan',
                          a: 'Kami menghargai kepercayaan Anda dalam memberikan Informasi Pribadi Anda kepada kami, oleh karena itu kami berusaha untuk menggunakan cara yang dapat diterima secara komersial untuk melindunginya. Tetapi ingat bahwa tidak ada metode transmisi melalui internet, atau metode penyimpanan elektronik yang 100% aman dan andal, dan kami tidak dapat menjamin keamanan mutlaknya.'),
                      _qna(
                          q: 'Tautan ke Situs Lain',
                          a: 'Layanan ini mungkin berisi tautan ke situs lain. Jika Anda mengklik tautan pihak ketiga, Anda akan diarahkan ke situs itu. Perhatikan bahwa situs eksternal ini tidak dioperasikan oleh kami. Oleh karena itu, kami sangat menyarankan Anda untuk meninjau Kebijakan Privasi situs web ini. Kami tidak memiliki kendali atas dan tidak bertanggung jawab atas konten, kebijakan privasi, atau praktik situs atau layanan pihak ketiga mana pun.'),
                      _qna(
                          q: 'Privasi Anak-Anak',
                          a: 'Layanan ini tidak ditujukan kepada siapa pun yang berusia di bawah 13 tahun. Kami tidak dengan sengaja mengumpulkan informasi pengenal pribadi dari anak-anak di bawah 13 tahun. Jika kami menemukan bahwa seorang anak di bawah 13 tahun telah memberi kami informasi pribadi, kami segera menghapusnya dari server. Jika Anda adalah orang tua atau wali dan Anda mengetahui bahwa anak Anda telah memberikan informasi pribadi kepada kami, silakan hubungi kami sehingga kami dapat melakukan tindakan yang diperlukan.'),
                      _qna(
                          q: 'Perubahan Kebijakan Privasi Ini',
                          a: 'Kami dapat memperbarui Kebijakan Privasi kami dari waktu ke waktu. Oleh karena itu, Anda disarankan untuk meninjau halaman ini secara berkala untuk setiap perubahan. Kami akan memberi tahu Anda tentang perubahan apa pun dengan memposting Kebijakan Privasi baru di halaman ini. Perubahan ini berlaku segera setelah diposting di halaman ini'),
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hubungi Kami',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            RichText(
                              text: TextSpan(
                                text:
                                    'Jika Anda memiliki pertanyaan atau saran tentang Kebijakan Privasi kami, jangan ragu untuk menghubungi kami di',
                                style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' customerservice-appherai@gmail.com',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _qna(
                          q: 'Q: Apa itu HerAi?',
                          a: 'A: HerAi adalah aplikasi Digital Waste Management, dimana User bisa berpartisipasi dalam melaksanakan program daur ulang sampah dengan menjual sampah dan mendapatkan imbalan Rupiah berdasarkan berat sampah yang kita terima. Sampah yang kamu jual akan kita jemput lho :).'),
                      _qna(
                          q: 'Q: Bagaimana cara kerja HerAi?',
                          a: 'A: User dapat menjual sampah yang sudah tidak terpakai dengan klik "Pilah Sampah" pada menu utama, lalu memilih sampah yang akan dijual ke kita. Armada Pickup kita lalu akan melakukan penjemputan sampah anda.'),
                      _qna(
                          q: 'Q: Berapa lama proses penjemputan ?',
                          a: 'A: Kami akan tetap usahakan sampah kamu kita jemput dalam 1 - 5 hari kedepan.'),
                      _qna(
                          q: 'Q: Jenis sampah apa saja yang diterima di HerAi?',
                          a: 'A: Untuk saat ini kami hanya menerima sampah recyclable atau yang dapat di daur ulang, contohnya seperti botol plastik, kertas, gelas, kaleng, dan lain sebagainya.'),
                      _qna(
                          q: 'Q: Cakupan Area HerAi ?',
                          a: 'A: Wilayah penjemputan HerAi yaitu Malang.'),
                      _qna(
                          q: 'Q: Bagaimana cara saya menghapus Akun ?',
                          a: 'A: Anda bisa mengirim email ke call center kami costumerservice-appherai@gmail.com dan memberikan informasi user id, nama, No. Telp, dan email dengan benar.'),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _qna({required String q, required String a}) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            q,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            a,
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
