// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:test_project/constants.dart';

class ChoseAction1Level extends StatefulWidget {
  int index;
  String title;
  bool open;
  bool oneItem;
  bool isCanOpen;
  VoidCallback? tapOpen;
  VoidCallback? tapSelect;
  bool isSelected;
  ChoseAction1Level({
    required this.title,
    required this.index,
    this.open = false,
    this.oneItem = false,
    this.isCanOpen = false,
    this.tapOpen,
    required this.tapSelect,
    required this.isSelected,
  });

  @override
  State<ChoseAction1Level> createState() => _ChoseAction1LevelState();
}

class _ChoseAction1LevelState extends State<ChoseAction1Level> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 56,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Visibility(
                visible: widget.isCanOpen,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 4.0,
                    right: 4,
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
                  padding: EdgeInsets.only(left: widget.isCanOpen ? 0 : 16),
                  child: Text(
                    widget.title,
                    style: TextStyle(
                        color: const Color(0xFF1B1717),
                        fontSize: 16.0,
                        fontWeight:
                            widget.oneItem ? FontWeight.w400 : FontWeight.w700,
                        height: 1.0),
                  ),
                ),
              ),
              const SizedBox(
                width: 18.0,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  onPressed: widget.tapSelect,
                  padding: EdgeInsets.zero,
                  icon: Container(
                    width: 24.0,
                    height: 24.0,
                    decoration: BoxDecoration(
                      color: widget.isSelected ? kVioletColor : kDividerColor2,
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
        Padding(
          padding: EdgeInsets.only(left: widget.open ? 52 : 0),
          child: Divider(
            height: 1,
            color: widget.open ? kDividerColor2 : kDividerColor1,
          ),
        ),
      ],
    );
  }
}
