import 'package:etech_demo/model/local/user.dart' as local;
import 'package:realm/realm.dart';

/// RealM Configuration
class RealmConfig {
  static late LocalConfiguration config;
  static late Realm realm;

  /// init realm
  static void init() {
    config = Configuration.local([local.User.schema]);
    realm = Realm(config);
  }
}
