import 'dart:math';

import '../objects/scene_object.dart';
import '../structs/shader.dart';
import '../structs/vector_3.dart';

abstract class SceneLight {

  num get intensity;

  num getPointIntensity(SceneObject? object, Vector3 intersection);

  num getDiffusionIntensity(Vector3 normal, Vector3 direction) {
    if (0 < normal ^ direction) {
      return intensity * (normal ^ direction) / (normal.magnitude * direction.magnitude);
    }
    return 0;
  }

  num getSpecularIntensity(Shader shader, Vector3 normal, Vector3 direction, Vector3 view) {
    if (shader.specular == -1) {
      return 0;
    }
    var reflection = (normal * (normal ^ direction) * 2) - direction;
    if (reflection ^ view < 0) {
      return intensity * pow((reflection ^ view) / (reflection.magnitude * view.magnitude), shader.specular);
    }
    return 0;
  }
}
