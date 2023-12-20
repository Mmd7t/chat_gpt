import 'package:chat_gpt/config/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart' hide Svg;
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../core/widgets/loading_dialog.dart';

//NOTE ==> Custom MediaQuery Extension
extension MediaQueryValues on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

//NOTE ==> Custom Theme Extension
extension ThemeValues on BuildContext {
  ColorScheme get color => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
}

//NOTE ==> Loading Dialog Extension
extension LoadingDialogExtension on BuildContext {
  void get loading => showDialog(
        context: this,
        builder: (context) => const LoadingDialog(),
      );
  void get loaded => Navigator.of(this).pop();
}

extension CustomInputDecoration on InputDecoration {
  static InputDecoration decorate(
    BuildContext context, {
    required String hint,
    IconData? prefixIcon,
    Widget? suffixIcon,
    Color? prefixIconColor,
  }) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      hintText: hint,
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      hintStyle: TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.normal,
        fontSize: context.textTheme.labelMedium!.fontSize,
      ),
      prefixIconConstraints: const BoxConstraints(minWidth: 50, minHeight: 50),
      prefixIcon:
          prefixIcon == null ? null : Icon(prefixIcon, color: prefixIconColor),
      suffixIcon: suffixIcon ?? const SizedBox(),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.32),
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.32),
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: context.color.error,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.32),
          width: 1,
        ),
      ),
    );
  }
}

//NOTE ==> Custom Icon Provider Extension
extension CustomIcon on String {
  Widget iconProvider(BuildContext context, {Color? color, double? size}) =>
      ImageIcon(
        Svg('assets/svgs/$this.svg'),
        color: color ?? context.color.primary,
        size: size ?? 24,
      );
  Widget icon({double? width}) => SvgPicture.asset(
        'assets/svgs/$this.svg',
        width: width,
      );
}

//NOTE ==> Custom Text Styles Extension
extension CustomTextStyles on String {
  Text headlineLarge(BuildContext context,
          {Color color = AppConstants.primaryColor}) =>
      Text(
        this,
        style: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: color, height: 1.5),
        textAlign: TextAlign.center,
      );
  Text headlineMedium(BuildContext context,
          {Color color = AppConstants.primaryColor}) =>
      Text(
        this,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: color, height: 1.5),
        textAlign: TextAlign.center,
      );
  Text headlineSmall(BuildContext context) => Text(
        this,
        style: Theme.of(context).textTheme.headlineSmall!,
        textAlign: TextAlign.center,
      );

  Text titleLarge(BuildContext context, {Color? color}) => Text(
        this,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: color ?? Theme.of(context).primaryColor,
            ),
        textAlign: TextAlign.center,
      );
  Text titleMedium(BuildContext context,
          {Color? color, bool centerText = true}) =>
      Text(
        this,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: color ?? Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700,
            ),
        textAlign: (centerText) ? TextAlign.center : TextAlign.start,
      );

  Text titleSmall(BuildContext context, {Color? color}) => Text(
        this,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: color ?? Theme.of(context).primaryColor,
            ),
      );
  Text labelLarge(BuildContext context, {Color? color, FontWeight? weight}) =>
      Text(
        this,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              color: color ?? Theme.of(context).primaryColor,
              fontWeight:
                  weight ?? Theme.of(context).textTheme.labelLarge!.fontWeight,
            ),
      );

  Text bodyLarge(BuildContext context, {Color? color, TextAlign? align}) =>
      Text(
        this,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: color ?? Colors.white,
            ),
        textAlign: align ?? TextAlign.start,
      );

  Text bodyMedium(BuildContext context, {Color? color, TextAlign? align}) =>
      Text(
        this,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: color ?? Colors.white,
            ),
        textAlign: align ?? TextAlign.start,
      );
  Text bodySmall(BuildContext context, {Color? color, FontWeight? weight}) =>
      Text(
        this,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: color ?? Colors.white,
              fontWeight: weight ?? FontWeight.normal,
            ),
      );
  Text labelSmall(
    BuildContext context, {
    Color? color,
    int? maxLines,
    FontWeight weight = FontWeight.normal,
    TextDecoration decoration = TextDecoration.none,
    TextAlign align = TextAlign.start,
  }) =>
      Text(
        this,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              color: color ?? Colors.grey.shade500,
              fontWeight: weight,
              decoration: decoration,
            ),
        textAlign: align,
        softWrap: true,
        maxLines: maxLines,
        // overflow: TextOverflow.ellipsis,
      );

  Text tiny(BuildContext context, {Color? color, FontWeight? weight}) => Text(
        this,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 10,
              color: color ?? Colors.grey.shade500,
              fontWeight: weight ?? FontWeight.normal,
            ),
      );
  Text veryTiny(BuildContext context, {Color? color}) => Text(
        this,
        style: Theme.of(context).textTheme.labelSmall!.copyWith(
              fontSize: 8,
              color: color ?? Colors.white,
            ),
      );
}
