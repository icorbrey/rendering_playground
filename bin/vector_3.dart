import 'dart:math';

class Vector3 {

  final num x;
  final num y;
  final num z;

  const Vector3(this.x, this.y, this.z);

  const Vector3.zero() : this(0, 0, 0);
  const Vector3.right() : this(1, 0, 0);
  const Vector3.left() : this(-1, 0, 0);
  const Vector3.up() : this(0, 1, 0);
  const Vector3.down() : this(0, -1, 0);
  const Vector3.forward() : this(0, 0, 1);
  const Vector3.back() : this(0, 0, -1);
  const Vector3.one() : this(1, 1, 1);

  const Vector3.positiveInfinity()
    : this(double.infinity, double.infinity, double.infinity);

  const Vector3.negativeInfinity()
    : this(double.negativeInfinity, double.negativeInfinity, double.negativeInfinity);

  Vector3 operator*(num other) =>
    Vector3(x * other, y * other, z * other);

  Vector3 operator/(num other) =>
    Vector3(x / other, y / other, z / other);

  Vector3 operator+(Vector3 other) =>
    Vector3(x + other.x, y + other.y, z + other.z);

  Vector3 operator-(Vector3 other) =>
    Vector3(x - other.x, y - other.y, z - other.z);

  num operator^(Vector3 other) =>
    x * other.x + y * other.y + z * other.z;

  num get squareMagnitude =>
    pow(x, 2) + pow(y, 2) + pow(z, 2);

  num get magnitude =>
    sqrt(squareMagnitude);

  Vector3 get normalized =>
    this / magnitude;
}
