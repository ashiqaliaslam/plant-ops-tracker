enum LottieAnimation {
  dataNotFound(name: 'data_not_found'),
  empty(name: 'empty'),
  loading(name: 'loading'),
  loadingRounds(name: 'loading_rounds'),
  error(name: 'error'),
  smallError(name: 'small_error');

  final String name;
  const LottieAnimation({required this.name});
}
