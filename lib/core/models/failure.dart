class Failure {
  String msg;
  Failure(this.msg);
}

class NoInternetConnectionFailure extends Failure {
  NoInternetConnectionFailure(super.msg);
}

class NoDataFailure extends Failure {
  NoDataFailure(super.msg);
}