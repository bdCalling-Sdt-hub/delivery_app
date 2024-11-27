import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_constants.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final bool? isObscureText;
  final String? obscureCharacter;
  final Color? fillColor;
  // final Widget? prefixIcon;
  final String? labelText;
  final String? prefixIcon;
  final Widget? sufixicons;
  final String? hintText;
  final dynamic? focusNode;
  final bool? readOnly;
  final double contenpaddingHorizontal;
  final double contenpaddingVertical;
  // final Widget? sufixicons;
  final FormFieldValidator? validator;
  final VoidCallback? onTap;
  final String? helperText;
  final AutovalidateMode? autovalidateMode;
  final Function(String value)? onChanged;
  final bool isPassword;
  final bool? isEmail;


  const CustomTextField({
    super.key,
    required this.contenpaddingHorizontal,
    required this.contenpaddingVertical,
    this.hintText,
    this.prefixIcon,
    this.readOnly = false,
    this.focusNode,
    this.sufixicons,
    this.validator,
    this.isEmail,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscureText = false,
    this.obscureCharacter = '*',
    this.fillColor,
    this.labelText,
    this.onTap,
    this.helperText,
    this.autovalidateMode,
    this.onChanged,
    this.isPassword = false
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    focusNode.removeListener(_onFocusChange);
    focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  bool obscureText = true;

  void toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      onTap: widget.onTap,
      readOnly: widget.readOnly!,
      onChanged: (value) {
        widget.onChanged?.call(value);
        setState(() {});
      },
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      obscureText: widget.isPassword ? obscureText : widget.isObscureText!,
      autovalidateMode: widget.autovalidateMode,
      obscuringCharacter: widget.obscureCharacter!,
      validator: widget.validator ??
              (value) {
            if (widget.isEmail == null) {
              if (value!.isEmpty) {
                return "Please enter ${widget.hintText!.toLowerCase()}";
              } else if (widget.isPassword) {
                bool data = AppConstants.passwordValidator.hasMatch(value);
                if (value.isEmpty) {
                  return "Please enter ${widget.hintText!.toLowerCase()}";
                } else if (!data) {
                  return "Insecure password detected.";
                }
              }
            } else {
              bool data = AppConstants.emailValidator.hasMatch(value!);
              if (value.isEmpty) {
                return "Please enter ${widget.hintText!.toLowerCase()}";
              } else if (!data) {
                return "Please check your email!";
              }
            }
            return null;
          },
      cursorColor: AppColors.textColor333333,
      style: TextStyle(color: _hasFocusOrText() ? AppColors.textColor333333 : Colors.black),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: widget.contenpaddingHorizontal,
          vertical: widget.contenpaddingVertical,
        ),
        filled: true,
        fillColor: widget.fillColor ?? AppColors.textColorFFFFFF,
        prefixIcon: _buildGradientIcon(widget.prefixIcon),
        suffixIcon: widget.isPassword
            ? GestureDetector(
          onTap: toggle,
          child: _suffixIcon(
            obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          ),
        )
            : widget.sufixicons,
        suffixIconConstraints: BoxConstraints(minHeight: 24.w, minWidth: 24.w),
        helperText: widget.helperText,
        prefixIconConstraints: BoxConstraints(minHeight: 24.w, minWidth: 24.w),
        errorStyle: const TextStyle(color: Colors.red),
        suffixIconColor: _hasFocusOrText() ? AppColors.gray767676 : AppColors.gray767676,
        prefixIconColor: _hasFocusOrText() ? AppColors.gray767676 : AppColors.gray767676,
        labelText: widget.labelText,
        hintText: widget.hintText,
        hintStyle:  const TextStyle(
          color: AppColors.textColorB1B1B1,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
        ),
        border: _buildOutlineInputBorder(),
        errorBorder: _buildOutlineInputBorder(),
        focusedBorder: _hasFocusOrText() ? _enabledBorder() : _buildOutlineInputBorder(),
        enabledBorder: _hasFocusOrText() ? _enabledBorder() : _buildOutlineInputBorder(),
        disabledBorder: _hasFocusOrText() ? _enabledBorder() : _buildOutlineInputBorder(),
      ),
    );
  }


  bool _hasFocusOrText() {
    return focusNode.hasFocus || widget.controller.text.isNotEmpty;
  }

  Widget _buildGradientIcon(String? assetPath) {
    return Padding(
      padding: EdgeInsets.only(left: 12.w, right: 8.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            assetPath ?? '',
            color: AppColors.orangeF37B1C,
            height: 24.h,
            width: 24.w,
          ),
          SizedBox(width: 8.w),
          Container(
            width: 2.w,
            height: 24.h,
            color: AppColors.textColorEDEDEE,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide:  const BorderSide(color: AppColors.textColorEDEDEE,width: 0.5),
    );
  }

  OutlineInputBorder _enabledBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide:  const BorderSide(color: AppColors.textColorEDEDEE,width: 0.5),
    );
  }
  _suffixIcon(IconData icon) {
    return Padding(padding: const EdgeInsets.all(12.0), child: Icon(icon));
  }
}
