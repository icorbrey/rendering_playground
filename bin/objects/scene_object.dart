import 'package:tuple/tuple.dart';

import '../structs/color.dart';
import '../structs/quaternion.dart';
import '../structs/vector_3.dart';

abstract class SceneObject {

  Vector3 get position;
  Quaternion get rotation;
  Color get color;

  Tuple2<num, num> intersect(Vector3 origin, Vector3 viewportIntersection);
}
