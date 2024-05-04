import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

part 'user.g.dart';

List<User> userListFromJson(String str) =>
    List<User>.from(json.decode(str).map((x) => User.fromJson(x["user"])));

@freezed
class User with _$User {
  const factory User({
    required String login,
    required int id,
    @JsonKey(name: "avatar_url") required String avatarUrl,
    @JsonKey(name: "subscriptions_url") required String subscriptionsUrl,
    @JsonKey(name: "organizations_url") required String organizationsUrl,
    required String type,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);
}
