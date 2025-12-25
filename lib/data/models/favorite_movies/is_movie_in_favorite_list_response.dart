class IsMovieInFavoriteListResponse {
  IsMovieInFavoriteListResponse({
      this.message, 
      this.data,});

  IsMovieInFavoriteListResponse.fromJson(dynamic json) {
    message = json['message'];
    data = json['data'];
  }
  String? message;
  bool? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['data'] = data;
    return map;
  }

}