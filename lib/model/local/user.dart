import 'package:realm/realm.dart'; // import realm package

part 'user.realm.dart'; // declare a part file.

@RealmModel() // define a data model class named `_Car`.
class _User {
  late String login;
  late int id;
  late String avatarUrl;
  late String subscriptionsUrl;
  late String organizationsUrl;
  late String type;
}
