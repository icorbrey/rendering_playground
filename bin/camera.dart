import 'package:tuple/tuple.dart';

import 'color.dart';
import 'quaternion.dart';
import 'scene_object.dart';
import 'vector_3.dart';

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

  @override
  Tuple2<num, num> intersect(Vector3 origin, Vector3 viewportIntersection) =>
    Tuple2(double.infinity, double.infinity);
}
