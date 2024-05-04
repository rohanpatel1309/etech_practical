import 'package:bloc/bloc.dart';
import 'package:etech_demo/provider/api_provider.dart';
import 'package:etech_demo/provider/realm_config.dart';
import 'package:etech_demo/viewmodel/userviewmodel/user_entity.dart';
import 'package:meta/meta.dart';

import '../../model/local/user.dart' as local;

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  int pageNo = 0;
  int perPage = 10;
  List<User> listUser = [];
  bool isLoading = false;
  int totalLength = 100;

  UserBloc() : super(UserInitial()) {
    on<UserEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is FetchUsers) {
        if (listUser.length <= totalLength && !isLoading) {
          isLoading = true;
          if (pageNo == 0) {
            emit(UserLoading());
          }
          final response =
              await ApiProvider().fetchUser(pageNo: pageNo, perPage: perPage);
          response.fold((l) {
            if (pageNo == 0) {
              RealmConfig.realm
                  .write(() => RealmConfig.realm.deleteAll<local.User>());
            }

            for (var element in l) {
              final user = local.User(
                  element.login,
                  element.id,
                  element.avatarUrl,
                  element.subscriptionsUrl,
                  element.organizationsUrl,
                  element.type);
              RealmConfig.realm.write(() => RealmConfig.realm.add(user));
            }

            final userEntity = RealmConfig.realm
                .all<local.User>()
                .toList()
                .skip(pageNo * perPage)
                .take(perPage)
                .map((element) => User(
                    login: element.login,
                    id: element.id,
                    avatarUrl: element.avatarUrl,
                    subscriptionsUrl: element.subscriptionsUrl,
                    organizationsUrl: element.organizationsUrl,
                    type: element.type))
                .toList();

            listUser.addAll(userEntity);
            pageNo++;
            emit(UserLoaded(listUser: listUser));
          }, (r) {
            emit(UserError());
          });

          isLoading = false;
        }
      }
    });
  }
}
