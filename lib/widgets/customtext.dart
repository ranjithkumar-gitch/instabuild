import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color textcolor;
  final bool underline;
  final Color? underlineColor;
  final TextAlign? textAlign;

  // 🔥 optional params
  final int? maxLines;
  final TextOverflow? overflow;

  const CustomText({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.textcolor,
    this.underline = false,
    this.underlineColor,
    this.textAlign,
    this.maxLines, // 👈 optional
    this.overflow, // 👈 optional
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines, // 👈 if null → unlimited
      overflow: overflow, // 👈 only applied if maxLines set
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: textcolor,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
        decorationColor: underline ? (underlineColor ?? textcolor) : null,
      ),
    );
  }
}

class PhoneNumberInputField extends StatelessWidget {
  final TextEditingController controller;

  const PhoneNumberInputField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      style: GoogleFonts.poppins(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: 'Mobile Number',
        labelStyle: GoogleFonts.poppins(color: Colors.grey, fontSize: 14),
        prefixIcon: GestureDetector(
          onTap: () {
            // showCountryPicker(
            //   context: context,
            //   showPhoneCode: true,
            //   onSelect: onCountryChanged,
            // );
          },
          child: Container(padding: const EdgeInsets.symmetric(horizontal: 8)),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD5D7DA)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFD5D7DA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Color(0xFFB0B0B0), width: 1),
        ),
      ),
    );
  }
}
