// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../../../shop/presentation/widgets/custom_toggle_button.dart';

// class CategoriesToggleBtn extends StatefulWidget {
//   CategoriesToggleBtn({
//     super.key,
//     required this.text,
//     required this.newIndex,
//   });

//   final int newIndex;
//   final String text;

//   List<bool> isSelected = [false, false, false, false, false];
//   String _choice = '';

//   @override
//   State<CategoriesToggleBtn> createState() => _CategoriesToggleBtnState();
// }

// class _CategoriesToggleBtnState extends State<CategoriesToggleBtn> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: REdgeInsets.only(
//         left: paddingOnlyLeft,
//         right: paddingOnlyRight,
//         top: paddingOnlyTop,
//         bottom: paddingOnlyBottom,
//       ),
//       child: SizedBox(
//         height: sizedBoxHeight,
//         width: sizedBoxWidth,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.symmetric(
//               horizontal: paddingHorizontal!,
//               vertical: paddingVertical!,
//             ),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(borderRadius!),
//               side: isActivity
//                   ? BorderSide.none
//                   : const BorderSide(color: Color(0xFF9B9B9B)),
//             ),
//             //primary: bgColor,
//             backgroundColor: isActivity ? bgColor : Colors.white,
//           ),
//           onPressed: onPressed,
//           child: Text(
//             text,
//             style: TextStyle(
//               color: isActivity ? textColor : Colors.black,
//               fontSize: fontSize,
//               fontWeight: fontWeight,
//             ),
//           ),
//         ),
//       ),
//     );
    
//     return CustomToggleButton(
//       sizedBoxHeight: 40.h,
//       sizedBoxWidth: 122.h,
//       isActivity: widget.isSelected[index],
//       text: widget.text,
//       onPressed: () {
//         for (int index = 0; index < widget.isSelected.length; index++) {
//           if (index == widget.newIndex) {
//             widget.isSelected[index] = true;
//           } else {
//             widget.isSelected[index] = false;
//           }
//         }

//         switch (widget.newIndex) {
//           case 0:
//             widget._choice = 'clothes';
//             break;
//           case 1:
//             widget._choice = 'shoes';
//             break;
//           case 2:
//             widget._choice = 'accesories';
//             break;
//           case 3:
//             widget._choice = '';
//             break;
//           case 4:
//             widget._choice = '';
//             break;
//         }
//       },
//     );
//   }
// }
