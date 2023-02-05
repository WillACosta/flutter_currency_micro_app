import 'package:flutter/widgets.dart';

import '../../core_ui.dart';

class CText extends StatelessWidget {
  final double fontSize;

  final String text;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign textAlign;

  const CText.headline(
    this.text, {
    super.key,
    this.color = CColors.white,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
  }) : fontSize = CFontSize.headline;

  const CText.head(
    this.text, {
    super.key,
    this.color = CColors.white,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.start,
  }) : fontSize = CFontSize.head;

  const CText.bodyHead(
    this.text, {
    super.key,
    this.color = CColors.white,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.start,
  }) : fontSize = CFontSize.bodyHead;

  const CText.body(
    this.text, {
    super.key,
    this.color = CColors.white,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  }) : fontSize = CFontSize.body;

  const CText.bodySmall(
    this.text, {
    super.key,
    this.color = CColors.white,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.start,
  }) : fontSize = CFontSize.bodySmall;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
