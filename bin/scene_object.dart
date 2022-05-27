import 'quaternion.dart';
import 'vector_3.dart';

abstract class SceneObject {
  Vector3 get position;
  Quaternion get rotation;
}
