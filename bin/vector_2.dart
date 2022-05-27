import 'dart:math';

class Vector2 {

  final double x;
  final double y;

  const Vector2(this.x, this.y);

  const Vector2.zero() : this(0, 0);
  const Vector2.right() : this(1, 0);
  const Vector2.left() : this(-1, 0);
  const Vector2.up() : this(0, 1);
  const Vector2.down() : this(0, -1);
  const Vector2.one() : this(1, 1);

  const Vector2.positiveInfinity()
    : this(double.infinity, double.infinity);

  const Vector2.negativeInfinity()
    : this(double.negativeInfinity, double.negativeInfinity);

  Vector2 operator*(num other) =>
    Vector2(x * other, y * other);

  Vector2 operator/(num other) =>
    Vector2(x / other, y / other);

  Vector2 operator+(Vector2 other) =>
    Vector2(x + other.x, y + other.y);

  Vector2 operator-(Vector2 other) =>
    Vector2(x - other.x, y - other.y);

  double get squareMagnitude =>
    pow(x, 2) + pow(y, 2) as double;

  double get magnitude =>
    sqrt(squareMagnitude);

  Vector2 get normalized =>
    this / magnitude;
}
