class AddFavoriteMovieRequest {
  String movieId;
  String name;
  double rating;
  String imageURL;
  String year;

  AddFavoriteMovieRequest({
    required this.movieId,
    required this.name,
    required this.rating,
    required this.imageURL,
    required this.year,
  });

  Map<String, dynamic> toJson() => {
    "movieId": movieId,
    "name": name,
    "rating": rating,
    "imageURL": imageURL,
    "year": year,
  };

}
