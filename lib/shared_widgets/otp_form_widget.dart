import 'package:flutter/material.dart';
import 'package:test_project/constants.dart';

class OtpFormWidget extends StatefulWidget {
  const OtpFormWidget({
    super.key,
    required this.onChanged,
  });

  final Function(List<String>) onChanged;

  @override
  State<OtpFormWidget> createState() => _OtpFormWidgetState();
}

class _OtpFormWidgetState extends State<OtpFormWidget> {
  final List<TextEditingController> textEditingControllers =
      List.generate(4, (_) => TextEditingController());

  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  final List<String> otp = List.filled(4, '');

  void otpLogic(BuildContext context, int index, String value) {
    otp[index] = value;
    if (value.isNotEmpty) {
      if (index < textEditingControllers.length - 1) {
        FocusScope.of(context).nextFocus();
      } else {
        FocusScope.of(context).unfocus();
      }
    } else {
      if (index > 0) {
        FocusScope.of(context).previousFocus();
      }
    }
    widget.onChanged(otp);
  }

  @override
  void dispose() {
    for (var controller in textEditingControllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(
        textEditingControllers.length,
        (index) => Row(
          children: [
            Container(
              width: 44,
              height: 48.0,
              margin: const EdgeInsets.symmetric(horizontal: 6.0),
              child: TextFormField(
                controller: textEditingControllers[index],
                focusNode: focusNodes[index],
                scrollPadding: EdgeInsets.zero,
                maxLength: 1,
                style: const TextStyle(
                  color: kAppBarColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 16.0,
                ),
                // autofocus: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                cursorWidth: 2,
                cursorHeight: 26,
                cursorRadius: const Radius.circular(2),
                cursorColor: kAppBarColor,
                decoration: InputDecoration(
                  counterText: '',
                  contentPadding:
                      EdgeInsets.only(left: focusNodes[index].hasFocus ? 1 : 3),
                  fillColor: Colors.white,
                  enabledBorder: kLogInOtpBorder,
                  errorBorder: kLogInOtpBorder,
                  focusedBorder: kLogInOtpBorderFocus,
                  focusedErrorBorder: kLogInOtpBorder,
                ),
                onTapOutside: (tap) {
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {
                  otpLogic(context, index, value);
                },
              ),
            ),
            index == 1
                ? const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6.0),
                    child: Text(
                      ':',
                      style: TextStyle(
                        color: kGrayColor,
                        fontWeight: FontWeight.w700,
                        fontSize: 32.0,
                        // height: 1.5,
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
