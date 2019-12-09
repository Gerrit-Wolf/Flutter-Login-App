import 'dart:async';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/widgets/BlocProvider.dart';

class LoginUserDataBloc extends BlocBase {
  LoginUserDataBloc() {
    init();
  }

  final StreamController<LoginUserData> _userDataController = StreamController<LoginUserData>();
  Sink<LoginUserData> get _inUserData => _userDataController.sink;
  Stream<LoginUserData> get outUserData => _userDataController.stream;

  void init() {
    _inUserData.add(LoginUserData.empty());
  }

  @override
  void dispose() {
    _userDataController.close();
  }

  void updateUserData(LoginUserData updatedUserData) {
    _inUserData.add(updatedUserData);
  }
}