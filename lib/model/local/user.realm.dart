// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

// ignore_for_file: type=lint
class User extends _User with RealmEntity, RealmObjectBase, RealmObject {
  User(
    String login,
    int id,
    String avatarUrl,
    String subscriptionsUrl,
    String organizationsUrl,
    String type,
  ) {
    RealmObjectBase.set(this, 'login', login);
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'avatarUrl', avatarUrl);
    RealmObjectBase.set(this, 'subscriptionsUrl', subscriptionsUrl);
    RealmObjectBase.set(this, 'organizationsUrl', organizationsUrl);
    RealmObjectBase.set(this, 'type', type);
  }

  User._();

  @override
  String get login => RealmObjectBase.get<String>(this, 'login') as String;
  @override
  set login(String value) => RealmObjectBase.set(this, 'login', value);

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get avatarUrl =>
      RealmObjectBase.get<String>(this, 'avatarUrl') as String;
  @override
  set avatarUrl(String value) => RealmObjectBase.set(this, 'avatarUrl', value);

  @override
  String get subscriptionsUrl =>
      RealmObjectBase.get<String>(this, 'subscriptionsUrl') as String;
  @override
  set subscriptionsUrl(String value) =>
      RealmObjectBase.set(this, 'subscriptionsUrl', value);

  @override
  String get organizationsUrl =>
      RealmObjectBase.get<String>(this, 'organizationsUrl') as String;
  @override
  set organizationsUrl(String value) =>
      RealmObjectBase.set(this, 'organizationsUrl', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  Stream<RealmObjectChanges<User>> get changes =>
      RealmObjectBase.getChanges<User>(this);

  @override
  User freeze() => RealmObjectBase.freezeObject<User>(this);

  EJsonValue toEJson() {
    return <String, dynamic>{
      'login': login.toEJson(),
      'id': id.toEJson(),
      'avatarUrl': avatarUrl.toEJson(),
      'subscriptionsUrl': subscriptionsUrl.toEJson(),
      'organizationsUrl': organizationsUrl.toEJson(),
      'type': type.toEJson(),
    };
  }

  static EJsonValue _toEJson(User value) => value.toEJson();
  static User _fromEJson(EJsonValue ejson) {
    return switch (ejson) {
      {
        'login': EJsonValue login,
        'id': EJsonValue id,
        'avatarUrl': EJsonValue avatarUrl,
        'subscriptionsUrl': EJsonValue subscriptionsUrl,
        'organizationsUrl': EJsonValue organizationsUrl,
        'type': EJsonValue type,
      } =>
        User(
          fromEJson(login),
          fromEJson(id),
          fromEJson(avatarUrl),
          fromEJson(subscriptionsUrl),
          fromEJson(organizationsUrl),
          fromEJson(type),
        ),
      _ => raiseInvalidEJson(ejson),
    };
  }

  static final schema = () {
    RealmObjectBase.registerFactory(User._);
    register(_toEJson, _fromEJson);
    return SchemaObject(ObjectType.realmObject, User, 'User', [
      SchemaProperty('login', RealmPropertyType.string),
      SchemaProperty('id', RealmPropertyType.int),
      SchemaProperty('avatarUrl', RealmPropertyType.string),
      SchemaProperty('subscriptionsUrl', RealmPropertyType.string),
      SchemaProperty('organizationsUrl', RealmPropertyType.string),
      SchemaProperty('type', RealmPropertyType.string),
    ]);
  }();

  @override
  SchemaObject get objectSchema => RealmObjectBase.getSchema(this) ?? schema;
}
