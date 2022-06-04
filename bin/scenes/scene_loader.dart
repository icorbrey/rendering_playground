import 'dart:io';

import 'package:yaml/yaml.dart';

import '../lights/ambient_light.dart';
import '../lights/directional_light.dart';
import '../lights/point_light.dart';
import '../lights/scene_light.dart';
import '../objects/camera.dart';
import '../objects/scene_object.dart';
import '../objects/sphere.dart';
import '../rendering/image_canvas.dart';
import 'scene.dart';

class SceneLoader {

  Scene loadScene(String path) {
    var scene = loadYaml(File(path).readAsStringSync()) as Map;
    return Scene(
      camera: _loadCamera(scene),
      canvas: _loadCanvas(scene),
      objects: _loadObjects(scene),
      lights: _loadLights(scene),
    );
  }

  Camera _loadCamera(Map yaml) =>
    Camera.fromMap(yaml['camera']);

  ImageCanvas _loadCanvas(Map yaml) =>
    ImageCanvas.fromMap(yaml['canvas']);

  List<SceneObject> _loadObjects(Map yaml) {
    List<SceneObject> objects = [];
    for (var object in yaml['objects']) {
      switch (object['type']) {
        case 'sphere':
          objects.add(Sphere.fromMap(object));
          break;
      }
    }
    return objects;
  }

  List<SceneLight> _loadLights(Map yaml) {
    List<SceneLight> lights = [];
    for (var light in yaml['lights']) {
      switch (light['type']) {
        case 'ambient':
          lights.add(AmbientLight.fromMap(light));
          break;
        case 'point':
          lights.add(PointLight.fromMap(light));
          break;
        case 'directional':
          lights.add(DirectionalLight.fromMap(light));
          break;
      }
    }
    return lights;
  }
}
