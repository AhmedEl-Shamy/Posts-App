import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class InternetCheckerService {
  Future<bool> isConnectedToInternet();
}

class InternetCheckerServiceImpl implements InternetCheckerService {
  final InternetConnectionChecker internetConnectionChecker;
  const InternetCheckerServiceImpl(this.internetConnectionChecker);

  @override
  Future<bool> isConnectedToInternet() async {
    return await internetConnectionChecker.hasConnection;
  }
}