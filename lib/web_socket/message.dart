// {"id":"c4f664c3-26d1-46e0-89e1-86d1fa08310f","Content":"欢迎 aHJwY29xMzhtMmdicjRneQ==","sent_at":1620482028,"type":6,"from":"aHJwY29xMzhtMmdicjRneQ==","to":null,"from_user_id":"","to_user_id":"","ext":null}
import 'content.dart';

class Message {
  final String id;
  final Content content;
  final int sent_at;
  final int type;
  final String from;
  final List<String> to;
  final int from_user;
  final List<int> to_user;

  Message({
    required this.id,
    required this.content,
    required this.sent_at,
    required this.type,
    required this.from,
    required this.to,
    required this.from_user,
    required this.to_user,
  });

  // Message(this.id, this.content, this.sent_at, this.type, this.from, this.to, this.from_user_id, this.to_user_id, this.ext);

  Message.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        content = json["content"],
        sent_at = json["sent_at"],
        type = json["type"],
        from = json["from"],
        to = json["to"],
        from_user = json["from_user"],
        to_user = json["to_user"];

  Map<String, dynamic> toJson() => {
        "id": id,
        "content": content.toJson(),
        "sent_at": sent_at,
        "type": type,
        "from": from,
        "to": to,
        "from_user": from_user,
        "to_user": to_user,
      };
}
