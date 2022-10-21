import 'package:flutter/material.dart';

import '../../constant/color/colors.dart';

class TextFormfeildWidget extends StatelessWidget {
  const TextFormfeildWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: TextFormField(
        style: const TextStyle(
          fontSize: 20,
          color: kblackText,
          fontWeight: FontWeight.w600,
        ),
        // onChanged: (String value) {
        //   // setState(() {
        //   //   userInput.text = value.toString();
        //   // });
        // },
        decoration: InputDecoration(
          focusColor: Colors.white,
          filled: true,

          //add suffix icon
          suffixIcon: const Icon(
            Icons.my_location_outlined,
            color: Colors.grey,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          fillColor: Colors.white,

          hintText: 'Search delivery Location',

          //make hint text
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: 'verdana_regular',
            fontWeight: FontWeight.w400,
          ),

          //create lable
          labelText: 'Select Delivery Location',
          //lable style
          labelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontFamily: 'verdana_regular',
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
