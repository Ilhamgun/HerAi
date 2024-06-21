import 'package:get/get.dart';

class AppTranlation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          //Login
          'login_masukan_email': 'Email',
          'login_masukan_password': 'Password',
          'login_masuk': 'Sign In',
          'login_atau_masuk_dengan': 'Login With',
          'login_tidak_punya_akun': 'New user? ',
          'login_daftar_sekarang': 'Sign Up',

          //Register
          'register_ask': 'Already have an account? ',
          'register_login': 'Login',
          'register_judul_daftar': 'Sign Up',
          'register_masukan_email': 'Email',
          'register_masukan_nama_lengkap': 'Name',
          'register_masukan_password': 'Password',
          'register_konfirmasi_password': 'Confirm Password',
          'register_daftar': 'Sign Up',

          //Home
          'home_hallo': 'Hallo @name,',
          'home_selamat_datang!': 'Welcome to HerAi!',
          'home_pilah_sampah': 'Waste Scanning',
          'home_pilah_sampah_yang_dapat_didaur_ulang_menggunakan_kamera':
              'Sort your recyclable trash using the camera',
          'home_riwayat_transaksi': 'Transaction History',
          'home_ketahui_transaksi_yang_telah_dilakukan':
              'Transactions that have been made',

          //Profile Pengguna
          'profile_profil_pengguna': 'User Profile',
          'profile_total_transaksi': 'All Transactions',
          'profile_transfer_ke_dompet_digital': 'Transfer to Digital Wallet',
          'profile_transfer_ke_bank': 'Exchange coins at the garbage bank',
          'profile_coin_transaksi': 'Coin Transaction',

          //Settings
          'settings_pengaturan': 'Settings',
          'settings_alamat_penjemputan': 'Pick-up Address',
          'settings_riwayat_transaksi': 'Transaction History',
          'settings_beri_ulasan': 'Feedback',
          'settings_hubungi_kami': 'Contact Us ',
          'settings_ganti_bahasa': 'Language',
          'settings_syarat_dan_ketentuan': 'Term and Conditions',
          'settings_faq': 'FAQ',
          'settings_keluar': 'Logout',
          // Camera Results
          'camera_result_non_recyclable': 'Non-recyclable Trash',
          'camera_result_organic': 'Organic Trash',
          'camera_result_recyclable': 'Recyclable Trash',

          //Riwayat Transaksi
          'history_transaction_riwayat_transaksi': 'Transaction History',
          'history_transaction_menunggu': 'Waiting',
          'history_transaction_selesai': 'Completed',
          'history_transaction_tanggal': 'Tanggal',
          'history_transaction_client': 'Client',
          'history_transaction_total_berat': 'Total Berat',
          'history_transaction_total_harga': 'Total Harga',
          'history_transaction_menunggu_angkut': 'Waiting for delivery',
          'history_transaction_transaksi_berhasil': 'Transaction Success',

          //Hasil
          'result_hasil': 'Result',
          'result_sampah_daur_ulang': 'Sampah Daur Ulang\n(Recycleable)',
          'result_sampah_organik': 'Sampah Organik\n(Organic)',
          'result_botol_plastik': 'Plastic Bottle',
          'result_daun_daun_kering': 'leaves',
          'result_motherboard': 'Motherboard',
          'result_sampah_organik_tidak_bisa_dijual_mohon_pisah_sampahnya_ya':
              'Organic waste cannot be sold.\nPlease separate the waste!',
          'result_sampah_ini_tidak_bisa_di_daur_ulang_dan_tidak_bisa_dijual_mohon_pisah_sampahnya_ya':
              'This waste cannot be recycled and cannot be sold.\nPlease separate the waste!',
          'result_berat_kg': 'Weight (Kg)',
          'result_total_harga': 'Total Price',
          'result_keranjang': 'Cart',
          'result_halaman_awal': 'Home',

          //Select Trash
          'pilih_sampah_title': 'Select Trash',
          'pilih_sampah_tambah': 'Add',

          //Notification
          'notifikasi_title': 'Notification',

          //Cart
          'cart_gerobakku': 'Your Cart',
          'cart_tambah': 'Add',
          'cart_total_berat': 'Total Weight',
          'cart_total_harga': 'Total Price',
          'cart_upload_bukti': 'Upload proof',
          'cart_ayo_jual': 'Let’s Sell',
          'cart_ayo_halaman_awal': 'Home',

          //Gmaps
          'gmaps_titik_penjemputan': 'Pick Up Location',
          'gmaps_herAi_poin': 'HerAi Poin',
          'gmaps_angkut': 'Pick Up!',
          'gmaps_diluar_jangkauan': 'Out of range',
          'gmaps_tidak_tersedia': 'Not Available',

          //Successs
          'success_berhasil': 'Success!',
          'success_pengiriman_akan_diteruskan_ke_pengepul_silahkan_cek_status_di_riwayat_transaksi':
              'The shipment will be forwarded to the collector. Please check the status in Transaction History',
          'success_halaman_awal': 'Home',
          'success_lihat_riwayat_transaksi': 'Transaction History',

          //locationFlag
          'location_dialog_title' : 'Allow Location Access?',
          'location_dialog_content' : 'HerAi collects location data to enable set pick-up location, select waste bank location and determine direction of user location to waste bank only in background application.'
        },
/////////////////////////////////////    BAHASA     ///////////////////////////////////
        'id': {
          //Login
          'login_masukan_email': 'Masukan Email',
          'login_masukan_password': 'Masukan Password',
          'login_masuk': 'Masuk',
          'login_atau_masuk_dengan': 'Atau masuk dengan',
          'login_tidak_punya_akun': 'Tidak punya akun? ',
          'login_daftar_sekarang': 'Daftar sekarang',

          //Register
          'register_ask': 'Sudah punya akun? ',
          'register_login': 'Masuk Sekarang',
          'register_judul_daftar': 'DAFTAR',
          'register_masukan_email': 'Masukan Email',
          'register_masukan_nama_lengkap': 'Masukan Nama Lengkap',
          'register_masukan_password': 'Masukan Password',
          'register_konfirmasi_password': 'Konfirmasi Password',
          'register_daftar': 'Daftar',

          //Home
          'home_hallo': 'Hallo @name,',
          'home_selamat_datang!': 'Selamat Datang!',
          'home_pilah_sampah': 'Pilah Sampah',
          'home_pilah_sampah_yang_dapat_didaur_ulang_menggunakan_kamera':
              'Pilah sampahmu dengan camera',
          'home_riwayat_transaksi': 'Riwayat Transaksi',
          'home_ketahui_transaksi_yang_telah_dilakukan':
              'Ketahui transaksi yang telah dilakukan',

          //Profile Pengguna
          'profile_profil_pengguna': 'Profil Pengguna',
          'profile_total_transaksi': 'Total Transaksi',
          'profile_transfer_ke_dompet_digital': 'Transfer ke Dompet Digital',
          'profile_transfer_ke_bank': 'Tukar Coin di Bank Sampah',
          'profile_coin_transaksi': 'Transaksi Coin',

          //Settings
          'settings_pengaturan': 'Pengaturan',
          'settings_alamat_penjemputan': 'Alamat Penjemputan',
          'settings_riwayat_transaksi': 'Riwayat Transaksi',
          'settings_beri_ulasan': 'Beri Ulasan',
          'settings_hubungi_kami': 'Hubungi Kami',
          'settings_ganti_bahasa': 'Ganti Bahasa',
          'settings_syarat_dan_ketentuan': 'Syarat dan Ketentuan',
          'settings_faq': 'FAQ',
          'settings_keluar': 'Keluar',
          // Camera Results
          'camera_result_non_recyclable': 'Sampah Tidak Bisa Didaur Ulang',
          'camera_result_organic': 'Sampah Organik',
          'camera_result_recyclable': 'Sampah Daur Ulang',

          //Riwayat Transaksi
          'history_transaction_riwayat_transaksi': 'Riwayat Transaksi',
          'history_transaction_menunggu': 'Menunggu',
          'history_transaction_selesai': 'Selesai',
          'history_transaction_tanggal': 'Tanggal',
          'history_transaction_client': 'Client',
          'history_transaction_total_berat': 'Total Berat',
          'history_transaction_total_harga': 'Total Harga',
          'history_transaction_menunggu_angkut': 'Menunggu Angkut',
          'history_transaction_transaksi_berhasil': 'Transaksi Berhasil',

          //Hasil
          'result_hasil': 'Hasil',
          'result_sampah_daur_ulang':
              'Sampah terdeteksi dapat di daur ulang, segera pilih jenisnya jika mau dijual!',
          'result_sampah_organik': 'Sampah Organik',
          'result_botol_plastik': 'Botol Plastik',
          'result_daun_daun_kering': 'Daun-daun kering',
          'result_motherboard': 'Motherboard',
          'result_sampah_organik_tidak_bisa_dijual_mohon_pisah_sampahnya_ya':
              'Sampah Organik tidak bisa dijual\nMohon pisah sampahnya ya!',
          'result_sampah_ini_tidak_bisa_di_daur_ulang_dan_tidak_bisa_dijual_mohon_pisah_sampahnya_ya':
              'Sampah ini Tidak Bisa di Daur Ulang dan tidak bisa dijual Mohon pisah sampahnya ya!',
          'result_berat_kg': 'Berat (Kg)',
          'result_total_harga': 'Total Harga',
          'result_keranjang': 'Keranjang',
          'result_halaman_awal': 'Halaman Awal',

          //Pilih Sampah
          'pilih_sampah_title': 'Pilih Sampah',
          'pilih_sampah_tambah': 'Tambah',

          //Notification
          'notifikasi_title': 'Notifikasi',

          //Cart
          'cart_gerobakku': 'Gerobakku',
          'cart_tambah': 'Tambah',
          'cart_total_berat': 'Total Berat',
          'cart_total_harga': 'Total Harga',
          'cart_upload_bukti': 'Upload Bukti Timbangan',
          'cart_ayo_jual': 'Ayo Jual!',
          'cart_ayo_halaman_awal': 'Halaman Awal',

          //Gmaps
          'gmaps_titik_penjemputan': 'Titik Penjemputan',
          'gmaps_herAi_poin': 'HerAi Poin',
          'gmaps_angkut': 'Angkut!',
          'gmaps_tidak_tersedia': 'Tidak Tersedia',
          'gmaps_diluar_jangkauan': 'Diluar Jangkauan',

          //Successs
          'success_berhasil': 'Berhasil!',
          'success_pengiriman_akan_diteruskan_ke_pengepul_silahkan_cek_status_di_riwayat_transaksi':
              'Pengiriman akan diteruskan ke pengepul. Silahkan cek status di Riwayat Transaksi',
          'success_halaman_awal': 'Halaman Awal',
          'success_lihat_riwayat_transaksi': 'Lihat Riwayat Transaksi',

          //locationFlag
          'location_dialog_title' : 'Izinkan penggunaan lokasi?',
          'location_dialog_content' : 'HerAi mengumpulkan data lokasi untuk mengaktifkan set lokasi penjemputan, memilih lokasi bank sampah dan menentukan arah lokasi pengguna ke bank sampah hanya saat aplikasi sedang berjalan.'
        }
      };
}
