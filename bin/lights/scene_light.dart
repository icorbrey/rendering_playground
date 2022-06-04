import '../objects/scene_object.dart';
import '../structs/vector_3.dart';

abstract class SceneLight {

  num get intensity;

  num getPointIntensity(SceneObject? object, Vector3 intersection);
}
