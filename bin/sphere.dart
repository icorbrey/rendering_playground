import 'quaternion.dart';
import 'scene_object.dart';
import 'vector_3.dart';

class Sphere extends SceneObject {

  @override Vector3 position;
  @override Quaternion rotation;

  double radius;

  Sphere({
    required this.position,
    required this.rotation,
    required this.radius,
  });
}
