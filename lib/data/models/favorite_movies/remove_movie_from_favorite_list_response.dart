class RemoveMovieFromFavoriteListResponse {
  RemoveMovieFromFavoriteListResponse({
      this.statusCode, 
      this.message,});

  RemoveMovieFromFavoriteListResponse.fromJson(dynamic json) {
    statusCode = json['statusCode'];
    message = json['message'];
  }
  num? statusCode;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['statusCode'] = statusCode;
    map['message'] = message;
    return map;
  }

}