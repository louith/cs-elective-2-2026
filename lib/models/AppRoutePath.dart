class AppRoutePath {
  final int? detailId;
  const AppRoutePath.home() : detailId = null;
  const AppRoutePath.details(this.detailId);
  bool get isDetailsPage => detailId != null;
}
