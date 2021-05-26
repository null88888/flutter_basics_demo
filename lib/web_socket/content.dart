// {"id":"c4f664c3-26d1-46e0-89e1-86d1fa08310f","Content":"欢迎 aHJwY29xMzhtMmdicjRneQ==","sent_at":1620482028,"type":6,"from":"aHJwY29xMzhtMmdicjRneQ==","to":null,"from_user_id":"","to_user_id":"","ext":null}
class Content {
  final int code;
  final String route;
  final String message;
  final Map<String, dynamic> data;

  Content({
    required this.code,
    required this.route,
    required this.message,
    required this.data,
  });

  Content.fromJson(Map<String, dynamic> json)
      : code = json["code"],
        route = json["route"],
        message = json["message"],
        data = json["data"];

  Map<String, dynamic> toJson() => {
        "code": code,
        "route": route,
        "message": message,
        "data": data,
      };
}
