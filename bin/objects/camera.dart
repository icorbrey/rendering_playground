import 'package:tuple/tuple.dart';

import '../structs/color.dart';
import '../structs/quaternion.dart';
import '../structs/vector_3.dart';
import 'scene_object.dart';

class Camera extends SceneObject {

  @override Vector3 position;
  @override Quaternion rotation;
  @override Color color;

  final num viewportWidth;
  final num viewportHeight;
  final num viewportDepth;

  Camera({
    required this.position,
    required this.rotation,
    required this.viewportDepth,
    required this.viewportWidth,
    required this.viewportHeight,
  })
    : color = Color.black();

  factory Camera.fromMap(Map camera) => Camera(
    rotation: Quaternion.fromMap(camera['rotation']),
    position: Vector3.fromMap(camera['position']),
    viewportHeight: camera['viewport']['height'],
    viewportDepth: camera['viewport']['depth'],
    viewportWidth: camera['viewport']['width'],
  );

  @override
  Tuple2<num, num> intersect(Vector3 origin, Vector3 viewportIntersection) =>
    Tuple2(double.infinity, double.infinity);

  @override
  Vector3 getNormal(Vector3 intersection) =>
    Vector3.zero();
}
