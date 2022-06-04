import 'rendering/image_canvas.dart';
import 'rendering/raytracer.dart';
import 'scenes/scene_loader.dart';

void main(List<String> arguments) {
  var scene = SceneLoader().loadScene('./bin/scenes/sphere-scene.yaml');
  Raytracer(scene).render();
  (scene.canvas as ImageCanvas).export('/mnt/c/Users/icorbrey/Pictures/render.png');
}
