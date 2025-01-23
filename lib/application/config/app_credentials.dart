class AppCredentials {
  final String apiUrl;
  final String imageUrl;

  AppCredentials._({
    required this.apiUrl,
    required this.imageUrl,
  });

  factory AppCredentials.prod() => AppCredentials._(
        apiUrl: "https://api.themoviedb.org/3",
        imageUrl: "https://image.tmdb.org/t/p",
      );
}
