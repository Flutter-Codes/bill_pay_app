import 'package:bill_pay/utils/custom_color.dart';
import 'package:bill_pay/widgets/textbuilder.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final bool? enableSufix;
  final List<String>? items;
  final Function(String?)? onChanged;
  final String? selectedItem;
  final TextEditingController? textController;
  final TextInputType? inputType;
  final int? maxline;

  final Function()? onTap;
  const CustomTextField({
    Key? key,
    this.hintText,
    this.enableSufix = false,
    this.items,
    this.onChanged,
    this.selectedItem,
    this.textController,
    this.inputType = TextInputType.text,
    this.maxline = 1,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(0xffE4EAF1),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onTap: onTap,
              controller: textController,
              maxLines: maxline,
              keyboardType: inputType,
              style: TextStyle(
                color: kPrimary,
                fontWeight: FontWeight.w500,
              ),
              decoration: InputDecoration(
                hintText: hintText,
                fillColor: Color(0xffE4EAF1),
                filled: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
                border: InputBorder.none,
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7293B9),
                ),
              ),
            ),
          ),
          if (enableSufix == true)
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedItem,
                  iconEnabledColor: Color(0xff96ACC6),
                  alignment: Alignment.centerRight,
                  hint: TextBuilder(
                    text: 'Select',
                    color: kPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                  items: items!.map((String selectedItem) {
                    return DropdownMenuItem<String>(
                      value: selectedItem,
                      child: TextBuilder(
                        text: selectedItem,
                        color: kPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
              ),
            )
        ],
      ),
    );
  }
}
