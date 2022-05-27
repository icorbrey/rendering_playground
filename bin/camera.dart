import 'quaternion.dart';
import 'scene_object.dart';
import 'vector_3.dart';

class Camera extends SceneObject {

  @override Vector3 position;
  @override Quaternion rotation;

  double fieldOfView;

  Camera({
    required this.position,
    required this.rotation,
    required this.fieldOfView,
  })
    : assert(0 < fieldOfView && fieldOfView < 360);
}
