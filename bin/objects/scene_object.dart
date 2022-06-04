import 'package:tuple/tuple.dart';

import '../structs/quaternion.dart';
import '../structs/shader.dart';
import '../structs/vector_3.dart';

abstract class SceneObject {

  Vector3 get position;
  Quaternion get rotation;
  Shader get shader;

  Vector3 getNormal(Vector3 intersection);
  Tuple2<num, num> intersect(Vector3 origin, Vector3 viewportIntersection);
}
