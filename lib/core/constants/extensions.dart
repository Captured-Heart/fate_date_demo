import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

DateTime get dateTimeNow => DateTime.now();
int get utcTimeNow => dateTimeNow.millisecondsSinceEpoch;

extension ThemeExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Size get size => MediaQuery.sizeOf(this);
  double get totlaDeviceHeight => size.height;
  double deviceHeight(double h) => size.height * h;
  double deviceWidth(double w) => size.width * w;
}

extension PaddingExtension on Widget {
  Padding padAll([double value = 0.0]) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }

  Padding padSymmetric({double horizontal = 0, double vertical = 0.0}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
      child: this,
    );
  }

  Padding padOnly({
    double top = 0.0,
    double right = 0.0,
    double bottom = 0.0,
    double left = 0.0,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: top, right: right, bottom: bottom, left: left),
      child: this,
    );
  }
}

extension ChildrenListSpacing on List<Widget> {
  List<Widget> paddingInColumn(double height) {
    return expand(
      (element) => [
        element,
        SizedBox(
          height: height,
        )
      ],
    ).toList();
  }

  List<Widget> paddingInRow(double width) {
    return expand(
      (element) => [
        element,
        SizedBox(
          width: width,
        )
      ],
    ).toList();
  }
}

extension DebugBorderWidgetExtension on Widget {
  Widget debugBorder({Color? color}) {
    if (kDebugMode) {
      return DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: color ?? Colors.red, width: 4),
        ),
        child: this,
      );
    } else {
      return this;
    }
  }
}

extension GestureExtension on Widget {
  Widget onTapWidget({required VoidCallback onTap, required String tooltip}) {
    return GestureDetector(
      onTap: onTap,
      child: Tooltip(message: tooltip, child: this),
    );
  }
}

extension DateTimeExtension on DateTime {
  String getGreetings() {
    var hour = this.hour;

    return greetings(hour);
  }
}

String greetings(int hour) {
  String greeting;
  if (hour >= 1 && hour < 12) {
    greeting = "Good morning";
  } else if (hour >= 12 && hour < 17) {
    greeting = "Good afternoon";
  } else if (hour >= 17 && hour < 20) {
    greeting = "Good evening";
  } else {
    greeting = "Good night";
  }

  return greeting;
}
