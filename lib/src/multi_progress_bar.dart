import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:multi_progress_bar/model/multi_progress_bar_model.dart';

class MultiProgressBar extends StatelessWidget {
  final bool enableLegends;
  final List<ProgressItem> progressList;
  final double deviceWidth = PlatformDispatcher.instance.views.first.physicalSize.width /
      PlatformDispatcher.instance.views.first.devicePixelRatio;

  MultiProgressBar({
    super.key,
    required this.progressList,
    this.enableLegends = false,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: checkValidProgressValues(),
      replacement: const Text("Please enter valid progress\nTotal progress can't be greater than 100 %"),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(children: buildStackChildren()),
          Visibility(
            visible: enableLegends,
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: buildLegendsChildren(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSegment(String text, Color color, double widthFactor) {
    return Tooltip(
      message: '$text %',
      triggerMode: TooltipTriggerMode.tap,
      showDuration: const Duration(milliseconds: 600),
      child: Container(
        width: deviceWidth * widthFactor,
        height: 34,
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(17)),
        ),
        child: Visibility(
          visible: double.parse(text) >= 20,
          child: Center(
            child: Text(
              '$text %',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
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

  List<Widget> buildLegendsChildren() {
    List<Widget> children = [];
    for (int i = 0; i < progressList.length; i++) {
      ProgressItem progressItem = progressList[i];
      children.add(
        _buildLabel(progressItem.title ?? '', progressItem.progressColor),
      );
    }
    return children;
  }

  List<Widget> buildStackChildren() {
    List<Widget> children = [];
    for (int i = 0; i < progressList.length; i++) {
      ProgressItem progressItem = progressList[i];
      children.add(
        Visibility(
          visible: i > 0,
          replacement:
              _buildSegment('${progressItem.progress * 100}', progressItem.progressColor, progressItem.progress),
          child: Padding(
            padding: EdgeInsets.only(left: deviceWidth * (sumUpToIndex(i) - (0.07 * i))),
            child: _buildSegment('${progressItem.progress * 100}', progressItem.progressColor, progressItem.progress),
          ),
        ),
      );
    }
    return children;
  }

  double sumUpToIndex(int index) {
    if (index < 0 || index >= progressList.length) {
      throw RangeError('Index out of range');
    }

    double sum = 0;
    for (int i = 0; i <= index; i++) {
      if (i > 0) {
        sum += progressList[i - 1].progress;
      }
    }
    return sum;
  }

  bool checkValidProgressValues() {
    Object sum = progressList.isNotEmpty
        ? progressList.reduce((a, b) => ProgressItem(progress: a.progress + b.progress, progressColor: Colors.black))
        : 0.0;
    ProgressItem progressItem = sum as ProgressItem;

    bool isValidProgress = progressItem.progress != 0 && progressItem.progress <= 1;
    if (!isValidProgress) {
      ///
    }
    return isValidProgress;
  }
}
