import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommentTextFormField extends FormField<String> {
  final TextEditingController? textEditingController;
  CommentTextFormField({
    bool usePhone = false,
    String? value,
    FocusNode? focusNode,
    Key? key,
    String? initialValue,
    String? title,
    String? labelText,
    Widget? action,
    String? hint,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool autoValidate = false,
    bool enabled = true,
    bool selected = false,
    bool readOnly = false,
    Widget? suffix,
    Widget? icon,
    Widget? prefix,
    bool filled = false,
    AutovalidateMode? autovalidateMode,
    this.textEditingController,
    bool isPassword = false,
    TextInputType? inputType,
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    int? maxLine,
    onTap,
    bool myAutoValidate = false,
    bool alwaysValidate = false,
    ValueChanged<String>? onChanged,
    TextInputAction? textInputAction,
    int? minLines,
    bool? autoFocus,
    TextStyle? hintStyle,
  }) : super(
            key: key,
            validator: validator,
            onSaved: onSaved,
            initialValue: initialValue,
            autovalidateMode: alwaysValidate
                ? AutovalidateMode.always
                : myAutoValidate
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
            builder: (FormFieldState field) {
              CommentTextFormFieldState state =
                  field as CommentTextFormFieldState;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (title != null)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            title,
                            style: Theme.of(state.context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          if (action != null) action
                        ],
                      ),
                    ),
                  TextField(
                    key: key,
                    focusNode: focusNode,
                    readOnly: readOnly,
                    minLines: minLines ?? 1,
                    maxLines: maxLine ?? 1,
                    autofocus: autoFocus ?? false,
                    cursorColor: const Color(0xffa0aec0),
                    textInputAction: textInputAction,
                    controller: textEditingController,
                    style: Theme.of(state.context)
                        .textTheme
                        .bodyText2!
                        .copyWith(
                          color:
                              readOnly ? const Color(0xffa0aec0) : const Color(0xffa0aec0),
                        ),
                    keyboardType: inputType,
                    inputFormatters: [
                      ...inputFormatters ?? [],
                      LengthLimitingTextInputFormatter(maxLength),
                    ],
                    onChanged: (text) {
                      state.didChange(text);
                      if (onChanged != null) {
                        onChanged(text);
                      }
                    },
                    decoration: const InputDecoration()
                        .applyDefaults(
                            Theme.of(state.context).inputDecorationTheme)
                        .copyWith(
                          fillColor: readOnly ? const Color(0xffF2F2F2) : null,
                          hintText: hint,
                          hintStyle: hintStyle ??
                              Theme.of(state.context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Color(0xff4a5568)),
                          labelText: labelText,
                          errorText: state.errorText,
                          enabled: enabled,
                          counterStyle: TextStyle(height: 0, fontSize: 0),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(44)),
                            borderSide:
                                BorderSide(color: Colors.transparent, width: 1),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(44)),
                            borderSide:
                                BorderSide(color: Color(0xffa0aec0), width: 1),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(44)),
                            borderSide:
                                BorderSide(color: Color(0xffa0aec0), width: 1),
                          ),
                          disabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(44)),
                            borderSide:
                                BorderSide(color: Color(0xffDDE1EF), width: 1),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(44)),
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 13),
                        ),
                  ),
                ],
              );
            });
  @override
  CommentTextFormFieldState createState() => CommentTextFormFieldState();
}

class CommentTextFormFieldState extends FormFieldState<String> {
  late TextEditingController textEditingController;

  @override
  CommentTextFormField get widget => super.widget as CommentTextFormField;

  @override
  void initState() {
    super.initState();
    textEditingController = widget.textEditingController ??
        TextEditingController(text: widget.initialValue);
  }
}
