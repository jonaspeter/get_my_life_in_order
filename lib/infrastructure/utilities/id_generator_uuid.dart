import 'package:uuid/uuid.dart';

import 'id_generator.dart';

class IdGeneratorUuid implements IdGenerator {
  IdGeneratorUuid() : uuid = Uuid();

  Uuid uuid;

  @override
  String getNewId() {
    return uuid.v1();
  }
}