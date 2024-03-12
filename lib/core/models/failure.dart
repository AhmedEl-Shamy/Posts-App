class Failure {
  String msg;
  Failure(this.msg);

  factory Failure.serverFailure () => Failure('Internal Server Error!');
  factory Failure.noDataFailure () => Failure('No Data');
  factory Failure.noInternetFailure () => Failure('No Internet Connection!');
}

// class NoInternetFailure extends Failure {
//   NoInternetFailure(super.msg);
// }

// class NoDataFailure extends Failure {
//   NoDataFailure(super.msg);
// }

// class ServerFailure extends Failure {
//   ServerFailure(super.msg);
// }