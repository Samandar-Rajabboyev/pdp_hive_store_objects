import 'package:flutter/material.dart';
import 'package:pdp_hive_store_objects/constants/colors.dart';

Widget buildTextField({required String hint, required TextEditingController controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 40),
      Text(
        hint,
        style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.w600),
      ),
      const SizedBox(height: 10),
      TextField(
        controller: controller,
        style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          hintText: "Enter $hint",
          hintStyle: TextStyle(color: clrLightGrey, fontSize: 14, fontWeight: FontWeight.w600),
          isDense: true,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: clrLightGrey),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: clrLightGrey),
          ),
        ),
      ),
    ],
  );
}
