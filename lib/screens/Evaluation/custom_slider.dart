import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double sliderHeight;
  final int min;
  final int max;
  final bool fullWidth;
  final int index;

  const CustomSlider(
      {super.key,
      this.sliderHeight = 35,
      this.max = 10,
      this.min = 0,
      this.fullWidth = false,
      required this.index});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double _value = 0;
  double paddingFactor = 0.2;
  List<Color> colors = const [
    Color(0xffFF9191),
    Color(0xffA380FF),
    Color(0xff57E3D8),
    Color(0xffFFDB5E),
    Color(0xffF4A664),
    Color(0xffFF9191),
  ];

  @override
  Widget build(BuildContext context) {
    if (widget.fullWidth) paddingFactor = 0.3;
    return Container(
      width: widget.fullWidth ? double.infinity : (widget.sliderHeight) * 7,
      height: (widget.sliderHeight),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular((5)),
        ),
        gradient: LinearGradient(
            colors: [
              colors[widget.index].withOpacity(0.7),
              colors[widget.index]
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 1.00),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(widget.sliderHeight * paddingFactor, 2,
            widget.sliderHeight * paddingFactor, 2),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white.withOpacity(1),
                    inactiveTrackColor: Colors.white.withOpacity(0.5),
                    trackHeight: 6.0,
                    thumbShape: CustomSliderTheme(
                        thumbRadius: widget.sliderHeight * 0.4,
                        min: widget.min,
                        max: widget.max,
                        thumbColor: colors[widget.index]),
                    overlayColor: Colors.white.withOpacity(0.4),
                    activeTickMarkColor: Colors.white,
                    inactiveTickMarkColor: Colors.red.withOpacity(.7),
                  ),
                  child: Slider(
                      thumbColor: Colors.black,
                      activeColor: colors[widget.index],
                      value: _value,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                        });
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSliderTheme extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;
  final Color thumbColor;

  const CustomSliderTheme(
      {required this.thumbRadius,
      this.min = 0,
      this.max = 10,
      required this.thumbColor});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final thumbPaint = Paint()
      ..color = thumbColor.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    // Border
    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    // Draw border
    canvas.drawCircle(center, thumbRadius * 0.9, borderPaint);

    // Draw circle
    canvas.drawCircle(center, thumbRadius * 0.9, thumbPaint);

    // Draw value
    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * 0.8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor,
      ),
      text: getValue(value),
    );

    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return (min + (max - min) * value).round().toString();
  }
}
