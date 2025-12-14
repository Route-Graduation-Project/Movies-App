class MessageResponse {
  String? message;

  MessageResponse({this.message});

  MessageResponse.fromJson(dynamic json) {
    final msg = json['message'];

    if (msg is String) {
      message = msg;
    } else if (msg is List) {
      // join list messages into a single readable string
      message = msg.join(', ');
    } else {
      message = null;
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }
}
