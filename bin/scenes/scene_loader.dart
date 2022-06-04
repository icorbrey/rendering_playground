import 'dart:io';

import 'package:yaml/yaml.dart';

import '../objects/camera.dart';
import '../objects/scene_object.dart';
import '../objects/sphere.dart';
import '../rendering/image_canvas.dart';
import '../structs/color.dart';
import '../structs/quaternion.dart';
import '../structs/vector_3.dart';
import 'scene.dart';

class SceneLoader {

  Scene loadScene(String path) {
    var scene = loadYaml(File(path).readAsStringSync()) as Map;
    return Scene(
      camera: _loadCamera(scene),
      canvas: _loadCanvas(scene),
      objects: _loadObjects(scene),
    );
  }

  Camera _loadCamera(Map yaml) => Camera(
    viewportHeight: yaml['camera']['viewport']['height'] ?? 1,
    viewportWidth: yaml['camera']['viewport']['width'] ?? 1,
    viewportDepth: yaml['camera']['viewport']['depth'] ?? 1,
    rotation: _toQuaternion(yaml['camera']['rotation']),
    position: _toVector3(yaml['camera']['position']),
  );

  ImageCanvas _loadCanvas(Map yaml) => ImageCanvas(
    height: yaml['canvas']['height'], 
    width: yaml['canvas']['width'],
  );

  List<SceneObject> _loadObjects(Map yaml) {
    List<SceneObject> objects = [];
    for (var object in yaml['objects']) {
      switch (object['type']) {
        case 'sphere': objects.add(Sphere(
          rotation: _toQuaternion(object['rotation']),
          position: _toVector3(object['position']),
          color: _toColor(object['color']),
          radius: object['radius'] ?? 1,
        ));
      }
    }
    return objects;
  }

  Vector3 _toVector3(Map? v) =>
    v != null
      ? Vector3(v['x'], v['y'], v['z'])
      : Vector3.zero();

  Quaternion _toQuaternion(Map? q) =>
    q != null
      ? Quaternion(q['w'], q['x'], q['y'], q['z'])
      : Quaternion.identity();

  Color _toColor(String? hex) =>
    Color.fromHex(hex ?? '#000000');
}
