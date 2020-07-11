import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/config/config.dart';
import 'package:frontend/models/recipe-detail-component-model.dart';
import 'package:frontend/shared_components/enums.dart';

@immutable
class CircularPercentageIndicator extends StatefulWidget {
  final double _radius = 55;

  final double _value;
  final double _recommendedValue;
  final double _percentage;
  final String _unit;
  final String _name;
  final Color _foregroundColor;
  final Color _backgroundColor;

  CircularPercentageIndicator(NutritionEntity entity)
      : _value = entity.value,
        _recommendedValue = entity.recommendedValue,
        _percentage = (entity.value / entity.recommendedValue) * 100.0,
        _unit = entity.unit,
        _name = entity.name,
        _foregroundColor = (entity.type == NutritionType.Makro
            ? Colors.green[400]
            : Colors.lime[400]),
        _backgroundColor = (entity.type == NutritionType.Makro
            ? Colors.green[100]
            : Colors.lime[100]);

  @override
  State<StatefulWidget> createState() => _CircularPercentageIndicatorState();
}

class _CircularPercentageIndicatorState
    extends State<CircularPercentageIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation _animation;
  Duration _animationDuration = Duration(milliseconds: 1000);

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    _animation =
        Tween(begin: 0.0, end: widget._percentage).animate(animationController)
          ..addListener(() {
            setState(() {});
          });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: CircularPercentage(_animation.value.toDouble(),
          widget._radius, widget._foregroundColor, widget._backgroundColor),
      child: Container(
        width: widget._radius * 1.5,
        height: widget._radius * 1.5,
        child: Center(
            child: Text(
          widget._name +
              "\n" +
              widget._value.toString() +
              "/" +
              widget._recommendedValue.toString() +
              " " +
              widget._unit +
              "\n" +
              " ${_animation.value.toInt()}%\n",
          style: TextStyle(
              fontSize: widget._radius / 5, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}

class CircularPercentage extends CustomPainter {
  double _strokeWidth;
  double _currentProgress;
  double _radius;
  Color _foregroundColor;
  Color _backgroundColor;

  CircularPercentage(this._currentProgress, this._radius, this._foregroundColor,
      this._backgroundColor) {
    _strokeWidth = _radius / 4;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint outerCircle = Paint()
      ..strokeWidth = _strokeWidth
      ..color = _backgroundColor
      ..style = PaintingStyle.stroke;

    Paint completeArc = Paint()
      ..strokeWidth = _strokeWidth
      ..color = _foregroundColor
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);

    double angle = 2 * pi * (_currentProgress / 100);

    canvas.drawCircle(center, _radius, outerCircle);
    canvas.drawArc(Rect.fromCircle(center: center, radius: _radius), -pi / 2,
        angle, false, completeArc);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
