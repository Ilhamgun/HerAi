class Global {
  static const BASE_URL = "https://appherai.com";
  static const CLASSIFY_BASE_URL = "https://herai-ml.ipat.my.id";
}

class Urls {
  Urls();

  static const classify = '/detection/';

//User Auth
  static const register = '/api/auth/register';
  static const login = '/api/auth/login';
  static const googleAuth = '/api/auth/google';
  static const fbAuth = '/api/auth/facebook';
  static const getUser = '/api/user';

  //Point Gudang
  static const getbyId = '/api/points/1';
  static const getviewAllPoints = '/api/points';

  //Cart (Gerobak)
  static const getActiveChart = '/api/carts';
  static const postAddItem = '/api/carts/items';
  static postEditItem({required String id}) => '/api/carts/items/$id';
  static deleteItem({required String id}) => '/api/carts/items/$id';
  static const uploadScales = '/api/carts/upload-scales';

  //Trash
  static const getTrash = '/api/trash?v=2';
  static const trashCategories = '/api/trash/categories';
  static const trashSearch = '{{host}}/api/trash/search';

  // static getPickUpById({required String id}) => '/api/pickup/$id';

  //PickUp
  static const postNewPickUpRequest = '/api/pickups';
  static getPickUpById({required String id}) => '/api/pickup/$id';

  //All Transaction
  static const getAllTransaction = '/api/transactions';
  static getStatusTransaction({required String status}) =>
      '/api/transactions?status=$status'; // waiting - delivered

  //Settings
  static getAddress({required String id}) => '/api/settings/user-address/$id';
  static const postAddAddress = '/api/settings/user-address/';
  static postEditAddress({required String id}) =>
      '/api/settings/user-address/$id';
  static delAddress({required String id}) => '/api/settings/user-address/$id';

  //Notification
  static const notification = '/api/notifications';

}
