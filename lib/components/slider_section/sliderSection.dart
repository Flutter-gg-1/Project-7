import 'package:flutter/material.dart';

class SliderSection extends StatefulWidget {
  final String label;
  final double value;
  final String imagePath;
  final ValueChanged<double> onChanged;

  SliderSection({
    required this.label,
    required this.value,
    required this.imagePath,
    required this.onChanged,
  });

  @override
  SliderSectionState createState() => SliderSectionState();
}

class SliderSectionState extends State<SliderSection> {
  double sliderValue = 0;
  double sliderWidth = 0;

  @override
  void initState() {
    super.initState();
    sliderValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        sliderWidth = constraints.maxWidth;
        return Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(widget.imagePath),
                  const SizedBox(width: 12),
                  Text(widget.label, style: const TextStyle(fontSize: 18)),
                ], ),
              const SizedBox(height: 10),
              Stack(
                clipBehavior: Clip.none, 
                alignment: Alignment.center,
                children: [
                  Slider(
                    value: sliderValue,
                    min: 1,
                    max: 10,
                    divisions: 9,
                    activeColor: const Color(0xFF4E2EB5),
                    inactiveColor: Colors.grey,
                    onChanged: (value) {
                      setState(() {
                        sliderValue = value;
                        widget.onChanged(value);
                      });},  ),
                  Positioned(
                    left: calculateLabelPosition(),
                    top: -25, 

                    child: Column(
                      children: [
                        Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.grey[400]!,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            sliderValue.toStringAsFixed(0),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold, ), ), ),
                        CustomPaint(
                          size: const Size(20, 10),
                          painter: TrianglePainter(
                            color: Colors.grey[400]!,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
  double calculateLabelPosition() {
    double fraction =
        (sliderValue - 1) / (10 - 1); 
    return (fraction * (sliderWidth - 48)) +4; 
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;

  TrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()..color = color;
    var path = Path();

    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
