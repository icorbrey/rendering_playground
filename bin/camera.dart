import 'dart:math';

import 'quaternion.dart';
import 'rect.dart';
import 'scene_object.dart';
import 'vector_3.dart';

class Camera extends SceneObject {

  @override Vector3 position;
  @override Quaternion rotation;

  final Rect viewport;
  final double viewportDepth;

  factory Camera({
    required Vector3 position,
    required Quaternion rotation,
    required double viewportDepth,
    required int viewportWidth,
    required int viewportHeight,
  }) {

    var _eulerAngles = rotation.eulerAngles;

    var _offsetUnit = Vector3(
      cos(_eulerAngles.pitch) * cos(_eulerAngles.yaw),
      cos(_eulerAngles.pitch) * sin(_eulerAngles.yaw),
      sin(_eulerAngles.pitch),
    );

    var _viewport = Rect(
      rotation: rotation,
      width: viewportWidth as double,
      height: viewportHeight as double,
      position: position + _offsetUnit * viewportDepth,
    );

    return Camera._(
      position: position,
      rotation: rotation,
      viewport: _viewport,
      viewportDepth: viewportDepth,
    );
  }

  Camera._({
    required this.position,
    required this.rotation,
    required this.viewport,
    required this.viewportDepth,
  });
}
