// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_project/constants.dart';

class ChoseAction2Level extends StatefulWidget {
  String title;
  bool open;
  bool end;
  bool oneItem;
  bool isCanOpen;
  bool isSelected;
  VoidCallback? tapOpen;
  VoidCallback? tapSelected;
  ChoseAction2Level({
    required this.title,
    this.open = false,
    this.end = false,
    this.oneItem = false,
    this.isCanOpen = false,
    this.tapOpen,
    this.tapSelected,
    required this.isSelected,
  });

  @override
  State<ChoseAction2Level> createState() => _ChoseAction2LevelState();
}

class _ChoseAction2LevelState extends State<ChoseAction2Level> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 1,
              height: widget.end ? 28 : null,
              margin: const EdgeInsets.only(left: 27),
              decoration: BoxDecoration(
                color: kDividerColor1,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    top: 24.0,
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 8.0,
                        height: 8.0,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kDividerColor1,
                          ),
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        width: 6.0,
                        height: 1.0,
                        decoration: BoxDecoration(
                          color: kDividerColor1,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: widget.isCanOpen,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 4.0,
                            left: 4.0,
                            right: 4.0,
                            bottom: 4.0,
                          ),
                          child: IconButton(
                            onPressed: widget.tapOpen,
                            padding: EdgeInsets.zero,
                            icon: SizedBox(
                              width: 24.0,
                              height: 24.0,
                              child: Icon(
                                widget.open
                                    ? Icons.keyboard_arrow_up
                                    : Icons.keyboard_arrow_down,
                                color: const Color(0xFF6A4DBA),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 16,
                              bottom: 16,
                              left: widget.isCanOpen ? 0 : 16),
                          child: Text(
                            widget.title,
                            style: TextStyle(
                                color: const Color(0xFF1B1717),
                                fontSize: 16.0,
                                fontWeight: widget.oneItem
                                    ? FontWeight.w400
                                    : FontWeight.w700,
                                height: 1.5),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 18.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0, right: 8.0),
                        child: IconButton(
                          onPressed: widget.tapSelected,
                          padding: EdgeInsets.zero,
                          icon: Container(
                            width: 24.0,
                            height: 24.0,
                            decoration: BoxDecoration(
                              color: widget.isSelected
                                  ? kVioletColor
                                  : kDividerColor2,
                              border: Border.all(color: kDividerColor1),
                              shape: BoxShape.circle,
                            ),
                            child: widget.isSelected
                                ? const Center(
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 16.0,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: widget.end
                      ? widget.open
                          ? 88
                          : 0
                      : widget.open
                          ? 88
                          : 52),
              child: Divider(
                height: 1,
                color: widget.end ? kDividerColor1 : kDividerColor2,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
