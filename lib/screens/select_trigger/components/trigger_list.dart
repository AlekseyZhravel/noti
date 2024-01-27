// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, avoid_function_literals_in_foreach_calls

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/constants.dart';
import 'package:test_project/screens/select_trigger/components/chose_action_1_level.dart';
import 'package:test_project/screens/select_trigger/components/chose_action_2_level.dart';
import 'package:test_project/screens/select_trigger/components/chose_action_3_level.dart';
import 'package:test_project/screens/select_trigger/select_trigger_model.dart';
import 'package:test_project/screens/select_trigger/triggers_controller.dart';

class TriggerList extends GetView<TriggersController> {
  List<SelectTriggerModel> list;
  int level;
  int? parentIndex;
  int? upperParentIndex;
  VoidCallback? onTapArrow;
  bool? selectAll;

  TriggerList({
    required this.list,
    required this.level,
    this.parentIndex,
    this.upperParentIndex,
    this.onTapArrow,
    this.selectAll,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: list.length,
      padding: EdgeInsets.zero,
      itemBuilder: (BuildContext context, int index) {
        return GetBuilder<TriggersController>(
            id: 'active_levels',
            builder: (logic) {
              return ActiveLevels(
                index: index,
                trigger: list[index],
                level: level,
                parentIndex: level <= 2 ? index : parentIndex!,
                upperParentIndex: level <= 1 ? index : upperParentIndex!,
                end: index == list.length - 1,
                endGroup: parentIndex != null && upperParentIndex != null
                    ? Get.arguments == 1
                        ? parentIndex ==
                            controller
                                    .storageService
                                    .selectOne[upperParentIndex!]
                                    .child!
                                    .length -
                                1
                        : parentIndex ==
                            controller
                                    .storageService
                                    .selectTwo[upperParentIndex!]
                                    .child!
                                    .length -
                                1
                    : false,
              );
            });
      },
    );
  }
}

class ActiveLevels extends GetView<TriggersController> {
  ActiveLevels({
    required this.index,
    required this.trigger,
    required this.level,
    required this.parentIndex,
    required this.upperParentIndex,
    required this.end,
    required this.endGroup,
  });

  SelectTriggerModel trigger;
  int index;
  int level;
  int parentIndex;
  int upperParentIndex;
  bool end;
  bool endGroup;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (index == 0 && level == 1)
          const Divider(
            height: 1,
            color: kDividerColor1,
          ),
        if (level == 1)
          ChoseAction1Level(
            index: 0,
            title: trigger.title,
            open: trigger.open,
            oneItem: trigger.oneItem,
            isCanOpen: trigger.child!.isNotEmpty,
            tapOpen: () {
              trigger.open = !trigger.open;
              if (index == 1) controller.shadowIsVisible = trigger.open;
              controller.update(['active_levels', 'bottom_bar']);
            },
            tapSelect: () {
              trigger.checkBox = !trigger.checkBox;
              if (index == 0) {
                controller.list.forEach((element1) {
                  if (trigger.checkBox) {
                    element1.checkBox = true;
                  } else {
                    element1.checkBox = false;
                    element1.child!.forEach((element) {
                      element.checkBox = true;
                    });
                    element1.child!.forEach((element2) {
                      element2.checkBox = false;
                      element2.child!.forEach((element3) {
                        element3.checkBox = false;
                      });
                    });
                    controller.update(['active_levels', 'bottom_bar']);
                  }
                });
              }
              controller.update(['active_levels', 'bottom_bar']);
            },
            isSelected: trigger.checkBox,
          ),
        if (level == 2)
          ChoseAction2Level(
            title: trigger.title,
            open: trigger.open,
            end: end,
            oneItem: trigger.oneItem,
            isCanOpen: trigger.child!.isNotEmpty,
            tapOpen: () {
              trigger.open = !trigger.open;
              controller.update(['active_levels', 'bottom_bar']);
            },
            isSelected: trigger.checkBox,
            tapSelected: () {
              trigger.checkBox = !trigger.checkBox;
              controller.update(['active_levels']);
            },
          ),
        if (level == 3)
          ChoseAction3Level(
            title: trigger.title,
            open: trigger.open,
            end: end,
            oneItem: trigger.oneItem,
            endGroup: end && endGroup,
            withLeftLine: !endGroup,
            isCanOpen: trigger.child!.isNotEmpty,
            tapOpen: () {
              trigger.open = !trigger.open;
              controller.update(['active_levels', 'bottom_bar']);
            },
            isSelected: trigger.checkBox,
            tapSelected: () {
              trigger.checkBox = !trigger.checkBox;
              controller.update(['active_levels']);
            },
          ),
        if (trigger.child!.isNotEmpty && trigger.open)
          TriggerList(
            list: trigger.child!,
            level: level + 1,
            parentIndex: parentIndex,
            upperParentIndex: upperParentIndex,
          ),
      ],
    );
  }
}
