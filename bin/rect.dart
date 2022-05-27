import 'quaternion.dart';
import 'scene_object.dart';
import 'vector_3.dart';

class Rect extends SceneObject {

  @override Vector3 position;
  @override Quaternion rotation;

  double width;
  double height;

  Rect({
    required this.position,
    required this.rotation,
    required this.width,
    required this.height,
  });
}
