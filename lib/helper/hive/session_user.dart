import 'package:hive/hive.dart';
part 'session_user.g.dart';

@HiveType(typeId: 0)
class SessionUser extends HiveObject {
  @HiveField(0)
  String uid;

  @HiveField(1)
  String email;

  @HiveField(2)
  String nama;

  @HiveField(3)
  String type;

  SessionUser(this.uid, this.email, this.nama, this.type);
}
