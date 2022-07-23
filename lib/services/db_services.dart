import 'package:hive/hive.dart';
import 'package:pdp_hive_store_objects/models/account_model.dart';

import '../models/user_model.dart';

class HiveDB {
  static var box = Hive.box("auth_db");

  /// For User Information
  // user's username
  static void storeUser(User user) {
    box.put('user', user.toMap);
  }

  static User loadUser() {
    return User.fromMap(box.get('user'));
  }

  static void removeUser() {
    box.delete("user");
  }

  /// For Account Information
  // new account's username
  static void storeAccount(Account account) {
    box.put('account', account.toMap);
  }

  static Account loadAccount() {
    return Account.fromMap(box.get('account'));
  }

  static void removeAccount() {
    box.delete("account");
  }
}
