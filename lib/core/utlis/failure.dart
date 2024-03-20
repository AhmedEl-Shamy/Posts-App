class Failure {
  final String msg;
  const Failure(this.msg);

  factory Failure.serverFailure () => const Failure('Internal Server Error!');
  factory Failure.noDataFailure () => const Failure('No Data');
  factory Failure.noInternetFailure () => const Failure('No Internet Connection!');
  // factory Failure.emptyInputsFailure (String inputFieldName) => Failure('$inputFieldName is a required Field');
}
