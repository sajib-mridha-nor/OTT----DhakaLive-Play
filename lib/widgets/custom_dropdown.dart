import 'package:dhakalive/utils/hexcolor.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {

  final String? initialValue;
  final TextStyle? labelStyle;
  final List<String> items;

  final Function(String? value) onChange;

  const CustomDropdown(
      {Key? key,
      this.labelStyle,
      required this.items,
      required this.onChange,
      this.initialValue})
      : super(key: key);

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _currentSelectedValue;

  @override
  Widget build(BuildContext context) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return DropdownButtonHideUnderline(
          child: DropdownButtonFormField<String>(
            isExpanded: true,
            value: widget.items.any((element) =>
                    element == _currentSelectedValue.toString().trim() ||
                    element == widget.initialValue)
                ? (_currentSelectedValue ?? widget.initialValue)
                : null,
            decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                    color: HexColor("#53433F"),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                      color: HexColor("#53433F"),
                    )),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 16)),
            isDense: false,
            onChanged: (newValue) {
              widget.onChange(newValue);
              setState(() {
                _currentSelectedValue = newValue!;
                state.didChange(newValue);
              });
            },
            items: widget.items.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, overflow: TextOverflow.ellipsis),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
