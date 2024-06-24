import 'package:flutter/material.dart';

class MultiProgressBar extends StatefulWidget {
  final double progressA;
  final double progressB;
  final double progressC;

  const MultiProgressBar({
    super.key,
    required this.progressA,
    required this.progressB,
    required this.progressC,
  });

  @override
  State<MultiProgressBar> createState() => _MultiProgressBarState();
}

class _MultiProgressBarState extends State<MultiProgressBar> {
  double orangePerc = 0;
  double lightBluePerc = 0;
  double yellowPerc = 0;

  @override
  void initState() {
    orangePerc = widget.progressA;
    lightBluePerc = widget.progressB;
    yellowPerc = widget.progressC;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            _buildSegment('${orangePerc * 100} %', Colors.orange, orangePerc),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * (orangePerc - 0.07),
              ),
              child: _buildSegment(
                  '${lightBluePerc * 100} %', Colors.lightBlue, lightBluePerc),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width *
                      (orangePerc + lightBluePerc - 0.14)),
              child: _buildSegment(
                  '${yellowPerc * 100} %', Colors.yellow, yellowPerc),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildLabel('Local PV', Colors.orange),
            _buildLabel('Grid renewable', Colors.lightBlue),
            _buildLabel('Other', Colors.yellow),
          ],
        ),
      ],
    );
  }

  Widget _buildSegment(String text, Color color, double widthFactor) {
    return Container(
      width: MediaQuery.of(context).size.width * widthFactor,
      height: 34,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(17)),
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 10,
          color: color,
        ),
        const SizedBox(width: 5),
        Text(
          text,
          style: TextStyle(fontSize: 16, color: Colors.grey[700]),
        ),
      ],
    );
  }
}
