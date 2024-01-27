// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_project/constants.dart';

class ChoseAction3Level extends StatefulWidget {
  String title;
  bool open;
  bool end;
  bool endGroup;
  bool oneItem;
  bool isCanOpen;
  bool isSelected;
  VoidCallback? tapOpen;
  VoidCallback? tapSelected;
  bool withLeftLine;
  ChoseAction3Level({
    required this.title,
    this.open = false,
    this.end = false,
    this.endGroup = false,
    this.oneItem = false,
    this.isCanOpen = false,
    this.tapOpen,
    this.tapSelected,
    this.withLeftLine = false,
    this.isSelected = false,
  });

  @override
  State<ChoseAction3Level> createState() => _ChoseAction3LevelState();
}

class _ChoseAction3LevelState extends State<ChoseAction3Level> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: widget.withLeftLine,
          child: Positioned.fill(
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 1,
                margin: const EdgeInsets.only(left: 27),
                decoration: BoxDecoration(
                  color: kDividerColor1,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: 1,
              height: widget.end ? 28 : null,
              margin: const EdgeInsets.only(left: 63),
              decoration: BoxDecoration(
                color: kDividerColor1,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 52.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 24.0),
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
                      crossAxisAlignment: CrossAxisAlignment.start, //start
                      children: [
                        Visibility(
                          visible: widget.isCanOpen,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 4.0,
                              right: 4,
                            ),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  widget.open = !widget.open;
                                });
                              },
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
                                top: 14,
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
                          padding: const EdgeInsets.only(
                            top: 4.0,
                            bottom: 4.0,
                            right: 8.0,
                          ),
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
            ),
            Padding(
              padding: EdgeInsets.only(left: widget.endGroup ? 0 : 88),
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
