import 'dart:async';
import 'package:test_app/widgets/BlocProvider.dart';

class LoginDataBloc extends BlocBase {
  LoginDataBloc() {
    init();
  }

  final StreamController<String> _errorMessageController = StreamController<String>();
  Sink<String> get _inErrorMessage => _errorMessageController.sink;
  Stream<String> get outErrorMessage => _errorMessageController.stream;

  final StreamController<bool> _loadingSpinnerController = StreamController<bool>();
  Sink<bool> get _inLoading => _loadingSpinnerController.sink;
  Stream<bool> get outLoading => _loadingSpinnerController.stream;

  void init() {
    _inErrorMessage.add(null);
    _inLoading.add(false);
  }

  @override
  void dispose() {
    _errorMessageController.close();
    _loadingSpinnerController.close();
  }

  void updateErrorMessage(String message) {
    _inErrorMessage.add(message);
  }

  void clearErrorMessage() {
    _inErrorMessage.add(null);
  }

  void showLoadingSpinner() {
    _inLoading.add(true);
  }

  void hideLoadingSpinner() {
    _inLoading.add(false);
  }
}